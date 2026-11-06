// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/// @notice Minimal fixed-price ERC-721 marketplace using the chain's native currency.
/// @dev Listed NFTs are held in escrow by this contract. No fees or royalties are charged.
contract ElysiumBazaar is IERC721Receiver, ReentrancyGuard {
    struct Listing {
        address seller;
        address nft;
        uint256 tokenId;
        uint256 price;
    }

    mapping(bytes32 => Listing) private listings;

    event Listed(bytes32 indexed listingId, address indexed seller, address indexed nft, uint256 tokenId, uint256 price);
    event Purchased(bytes32 indexed listingId, address indexed buyer, address indexed seller, address nft, uint256 tokenId, uint256 price);
    event Cancelled(bytes32 indexed listingId, address indexed seller, address indexed nft, uint256 tokenId);

    error InvalidAddress();
    error InvalidPrice();
    error NotTokenOwner();
    error NotSeller();
    error ListingNotFound();
    error IncorrectPayment();
    error TransferFailed();

    function listingId(address nft, uint256 tokenId) public pure returns (bytes32) {
        return keccak256(abi.encode(nft, tokenId));
    }

    function getListing(address nft, uint256 tokenId) external view returns (Listing memory) {
        return listings[listingId(nft, tokenId)];
    }

    function createListing(address nft, uint256 tokenId, uint256 price) external nonReentrant {
        if (nft == address(0)) revert InvalidAddress();
        if (price == 0) revert InvalidPrice();
        if (IERC721(nft).ownerOf(tokenId) != msg.sender) revert NotTokenOwner();

        bytes32 id = listingId(nft, tokenId);
        if (listings[id].seller != address(0)) revert ListingNotFound();

        IERC721(nft).safeTransferFrom(msg.sender, address(this), tokenId);
        listings[id] = Listing({
            seller: msg.sender,
            nft: nft,
            tokenId: tokenId,
            price: price
        });

        emit Listed(id, msg.sender, nft, tokenId, price);
    }

    function buy(address nft, uint256 tokenId) external payable nonReentrant {
        bytes32 id = listingId(nft, tokenId);
        Listing memory item = listings[id];
        if (item.seller == address(0)) revert ListingNotFound();
        if (msg.value != item.price) revert IncorrectPayment();

        delete listings[id];

        IERC721(item.nft).safeTransferFrom(address(this), msg.sender, item.tokenId);

        (bool sent, ) = payable(item.seller).call{value: msg.value}("");
        if (!sent) revert TransferFailed();

        emit Purchased(id, msg.sender, item.seller, item.nft, item.tokenId, item.price);
    }

    function cancelListing(address nft, uint256 tokenId) external nonReentrant {
        bytes32 id = listingId(nft, tokenId);
        Listing memory item = listings[id];
        if (item.seller == address(0)) revert ListingNotFound();
        if (item.seller != msg.sender) revert NotSeller();

        delete listings[id];
        IERC721(item.nft).safeTransferFrom(address(this), item.seller, item.tokenId);

        emit Cancelled(id, item.seller, item.nft, item.tokenId);
    }

    function onERC721Received(address, address, uint256, bytes calldata) external pure override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
}
