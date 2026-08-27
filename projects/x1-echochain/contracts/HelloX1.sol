// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract HelloX1 {
    string public message;
    address public owner;

    event MessageUpdated(string newMessage, address indexed updatedBy);

    constructor(string memory initialMessage) {
        owner = msg.sender;
        message = initialMessage;
    }

    function setMessage(string calldata newMessage) external {
        message = newMessage;
        emit MessageUpdated(newMessage, msg.sender);
    }
}
