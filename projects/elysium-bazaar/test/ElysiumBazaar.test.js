const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("ElysiumBazaar", function () {
  async function deployFixture() {
    const [seller, buyer, other] = await ethers.getSigners();
    const MockNFT = await ethers.getContractFactory("MockNFT");
    const nft = await MockNFT.deploy();
    await nft.waitForDeployment();

    const Bazaar = await ethers.getContractFactory("ElysiumBazaar");
    const bazaar = await Bazaar.deploy();
    await bazaar.waitForDeployment();

    await nft.mint(seller.address, 1);
    await nft.connect(seller).approve(await bazaar.getAddress(), 1);

    return { seller, buyer, other, nft, bazaar };
  }

  it("escrows an NFT when a listing is created", async function () {
    const { seller, nft, bazaar } = await deployFixture();
    await bazaar.connect(seller).createListing(await nft.getAddress(), 1, ethers.parseEther("2"));
    expect(await nft.ownerOf(1)).to.equal(await bazaar.getAddress());
    const item = await bazaar.getListing(await nft.getAddress(), 1);
    expect(item.seller).to.equal(seller.address);
    expect(item.price).to.equal(ethers.parseEther("2"));
  });

  it("rejects unsolicited NFT transfers so they cannot be trapped in escrow", async function () {
    const { seller, nft, bazaar } = await deployFixture();
    await expect(
      nft.connect(seller).safeTransferFrom(seller.address, await bazaar.getAddress(), 1)
    ).to.be.revertedWithCustomError(bazaar, "UnexpectedNFTTransfer");
    expect(await nft.ownerOf(1)).to.equal(seller.address);
  });

  it("sends the NFT to the buyer and native payment to the seller", async function () {
    const { seller, buyer, nft, bazaar } = await deployFixture();
    const price = ethers.parseEther("2");
    await bazaar.connect(seller).createListing(await nft.getAddress(), 1, price);

    const before = await ethers.provider.getBalance(seller.address);
    const tx = await bazaar.connect(buyer).buy(await nft.getAddress(), 1, { value: price });
    const receipt = await tx.wait();
    const after = await ethers.provider.getBalance(seller.address);

    expect(await nft.ownerOf(1)).to.equal(buyer.address);
    expect(after - before).to.equal(price);
    expect(receipt.status).to.equal(1);
  });

  it("returns the NFT to the seller when a listing is cancelled", async function () {
    const { seller, nft, bazaar } = await deployFixture();
    await bazaar.connect(seller).createListing(await nft.getAddress(), 1, 123);
    await bazaar.connect(seller).cancelListing(await nft.getAddress(), 1);
    expect(await nft.ownerOf(1)).to.equal(seller.address);
    expect((await bazaar.getListing(await nft.getAddress(), 1)).seller).to.equal(ethers.ZeroAddress);
  });

  it("rejects purchases with the wrong payment", async function () {
    const { seller, buyer, nft, bazaar } = await deployFixture();
    await bazaar.connect(seller).createListing(await nft.getAddress(), 1, 1000);
    await expect(bazaar.connect(buyer).buy(await nft.getAddress(), 1, { value: 999 }))
      .to.be.revertedWithCustomError(bazaar, "IncorrectPayment");
  });

  it("prevents another wallet from cancelling the seller's listing", async function () {
    const { seller, other, nft, bazaar } = await deployFixture();
    await bazaar.connect(seller).createListing(await nft.getAddress(), 1, 1000);
    await expect(bazaar.connect(other).cancelListing(await nft.getAddress(), 1))
      .to.be.revertedWithCustomError(bazaar, "NotSeller");
  });
});
