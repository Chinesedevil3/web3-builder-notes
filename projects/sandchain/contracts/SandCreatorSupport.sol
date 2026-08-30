// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SandCreatorSupport {
    uint256 public totalSupporters;
    address public latestSupporter;
    string public latestMessage;
    mapping(address => bool) public hasSupported;

    event CreatorSupported(address indexed supporter, string message, uint256 totalSupporters);

    function supportCreator(string calldata message) external {
        if (!hasSupported[msg.sender]) {
            hasSupported[msg.sender] = true;
            totalSupporters += 1;
        }

        latestSupporter = msg.sender;
        latestMessage = message;

        emit CreatorSupported(msg.sender, message, totalSupporters);
    }
}
