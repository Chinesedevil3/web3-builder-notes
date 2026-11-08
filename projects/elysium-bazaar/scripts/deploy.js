const { ethers } = require("hardhat");

async function main() {
  const network = await ethers.provider.getNetwork();
  if (network.chainId !== 99801n) {
    throw new Error(`Wrong network: expected chain ID 99801, received ${network.chainId}`);
  }

  const [deployer] = await ethers.getSigners();
  console.log("Deploying from:", deployer.address);
  console.log("Network chain ID:", network.chainId.toString());

  const Bazaar = await ethers.getContractFactory("ElysiumBazaar");
  const bazaar = await Bazaar.deploy();
  await bazaar.waitForDeployment();

  console.log("ElysiumBazaar deployed to:", await bazaar.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
