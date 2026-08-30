// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @notice Learning demo inspired by ERC-3643 permissioned-asset flows.
/// @dev This is NOT a full ERC-3643 implementation.
contract TrexEligibilityDemo {
    address public immutable issuer;
    uint256 public totalIssued;

    mapping(address => bool) public eligible;
    mapping(address => uint256) public units;

    event EligibilityUpdated(address indexed investor, bool allowed);
    event UnitsIssued(address indexed investor, uint256 amount, uint256 totalIssued);

    modifier onlyIssuer() {
        require(msg.sender == issuer, "issuer only");
        _;
    }

    constructor() {
        issuer = msg.sender;
    }

    function setEligibility(address investor, bool allowed) external onlyIssuer {
        eligible[investor] = allowed;
        emit EligibilityUpdated(investor, allowed);
    }

    function issue(address investor, uint256 amount) external onlyIssuer {
        require(eligible[investor], "investor not eligible");
        require(amount > 0, "amount = 0");

        units[investor] += amount;
        totalIssued += amount;

        emit UnitsIssued(investor, amount, totalIssued);
    }

    function canReceive(address investor) external view returns (bool) {
        return eligible[investor];
    }
}
