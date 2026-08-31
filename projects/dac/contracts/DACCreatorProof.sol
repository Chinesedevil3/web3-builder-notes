// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DACCreatorProof {
    struct Proof {
        address creator;
        string project;
        string proofURI;
        uint256 createdAt;
    }

    uint256 public proofCount;
    mapping(uint256 => Proof) public proofs;

    event ProofPublished(
        uint256 indexed proofId,
        address indexed creator,
        string project,
        string proofURI
    );

    function publishProof(
        string calldata project,
        string calldata proofURI
    ) external returns (uint256 proofId) {
        proofId = ++proofCount;

        proofs[proofId] = Proof({
            creator: msg.sender,
            project: project,
            proofURI: proofURI,
            createdAt: block.timestamp
        });

        emit ProofPublished(proofId, msg.sender, project, proofURI);
    }
}
