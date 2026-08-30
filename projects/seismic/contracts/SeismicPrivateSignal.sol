// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SeismicPrivateSignal {
    address public owner;
    uint256 public updates;

    suint256 private hiddenSignal;

    event SignalStored(address indexed owner, uint256 updates);

    constructor() {
        owner = msg.sender;
    }

    function setSignal(suint256 newSignal) external {
        require(msg.sender == owner, "owner only");
        hiddenSignal = newSignal;
        updates += 1;
        emit SignalStored(msg.sender, updates);
    }

    function increaseSignal(suint256 amount) external {
        require(msg.sender == owner, "owner only");
        hiddenSignal += amount;
        updates += 1;
        emit SignalStored(msg.sender, updates);
    }

    function readSignal() external view returns (suint256) {
        require(msg.sender == owner, "owner only");
        return hiddenSignal;
    }
}
