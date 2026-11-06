// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MockNFT is ERC721 {
    uint256 private nextId = 1;

    constructor() ERC721("Bazaar Test NFT", "BTNFT") {}

    function mint(address to, uint256 tokenId) external {
        _safeMint(to, tokenId);
    }
}
