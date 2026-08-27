// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract OrbPing {
    uint256 public totalPings;
    address public lastPinger;
    uint256 public lastPingBlock;

    event Ping(address indexed pinger, uint256 totalPings, uint256 blockNumber);

    function ping() external {
        totalPings += 1;
        lastPinger = msg.sender;
        lastPingBlock = block.number;
        emit Ping(msg.sender, totalPings, block.number);
    }
}
