// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ArcPalette {
    string public color;
    address public artist;

    event ColorChanged(string newColor, address indexed artist);

    constructor(string memory initialColor) {
        color = initialColor;
        artist = msg.sender;
    }

    function setColor(string calldata newColor) external {
        color = newColor;
        artist = msg.sender;
        emit ColorChanged(newColor, msg.sender);
    }
}
