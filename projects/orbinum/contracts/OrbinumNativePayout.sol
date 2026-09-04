// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IOrbinumBalances {
    function transfer(bytes32 dest, uint256 value) external;
    function transferKeepAlive(bytes32 dest, uint256 value) external;
}

contract OrbinumNativePayout {
    IOrbinumBalances public constant BALANCES =
        IOrbinumBalances(0x0000000000000000000000000000000000000802);

    address public immutable owner;

    event Funded(address indexed sender, uint256 amount);
    event NativePayout(bytes32 indexed recipientAccountId32, uint256 amount);

    error NotOwner();
    error ZeroAmount();
    error InsufficientBalance();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    receive() external payable {
        emit Funded(msg.sender, msg.value);
    }

    function fund() external payable {
        if (msg.value == 0) revert ZeroAmount();
        emit Funded(msg.sender, msg.value);
    }

    function payout(bytes32 recipientAccountId32, uint256 amount) external onlyOwner {
        if (amount == 0) revert ZeroAmount();
        if (address(this).balance < amount) revert InsufficientBalance();

        BALANCES.transfer(recipientAccountId32, amount);
        emit NativePayout(recipientAccountId32, amount);
    }

    function evmToAccountId32(address account) external pure returns (bytes32) {
        return bytes32(bytes.concat(bytes20(account), bytes12(0)));
    }
}
