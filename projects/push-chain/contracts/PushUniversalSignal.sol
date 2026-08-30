// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PushUniversalSignal {
    string public latestSignal;
    string public originLabel;
    address public sender;
    uint256 public totalSignals;

    event SignalSent(
        address indexed sender,
        string signal,
        string origin,
        uint256 totalSignals
    );

    function sendSignal(string calldata signal, string calldata origin) external {
        latestSignal = signal;
        originLabel = origin;
        sender = msg.sender;
        totalSignals += 1;

        emit SignalSent(msg.sender, signal, origin, totalSignals);
    }
}
