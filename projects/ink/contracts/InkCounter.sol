// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract InkCounter {
    uint256 public count;
    address public lastCaller;

    event CountChanged(uint256 newCount, address indexed caller);

    function increment() external {
        count += 1;
        lastCaller = msg.sender;
        emit CountChanged(count, msg.sender);
    }
}
