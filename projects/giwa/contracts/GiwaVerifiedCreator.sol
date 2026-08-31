// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface IDojangScroll {
    function isVerified(address addr, bytes32 attesterId) external view returns (bool);
    function getVerifiedAddressAttestationUid(address addr, bytes32 attesterId) external view returns (bytes32);
}

contract GiwaVerifiedCreator {
    address internal constant DOJANG_SCROLL = 0xd5077b67dcb56caC8b270C7788FC3E6ee03F17B9;

    // keccak256("dojang.dojangattesterids.upbitkorea")
    bytes32 internal constant ATTESTER_ID =
        0xd99b42e778498aa3c9c1f6a012359130252780511687a35982e8e52735453034;

    struct CreatorProof {
        address creator;
        string project;
        string proofURI;
        uint256 createdAt;
        bytes32 dojangAttestationUid;
    }

    uint256 public proofCount;
    mapping(uint256 => CreatorProof) public proofs;

    error NotVerified();

    event VerifiedProofPublished(
        uint256 indexed proofId,
        address indexed creator,
        string project,
        string proofURI,
        bytes32 dojangAttestationUid
    );

    modifier onlyVerified() {
        if (!IDojangScroll(DOJANG_SCROLL).isVerified(msg.sender, ATTESTER_ID)) {
            revert NotVerified();
        }
        _;
    }

    function publishProof(
        string calldata project,
        string calldata proofURI
    ) external onlyVerified returns (uint256 proofId) {
        bytes32 uid = IDojangScroll(DOJANG_SCROLL)
            .getVerifiedAddressAttestationUid(msg.sender, ATTESTER_ID);

        proofId = ++proofCount;
        proofs[proofId] = CreatorProof({
            creator: msg.sender,
            project: project,
            proofURI: proofURI,
            createdAt: block.timestamp,
            dojangAttestationUid: uid
        });

        emit VerifiedProofPublished(proofId, msg.sender, project, proofURI, uid);
    }

    function isVerified(address account) external view returns (bool) {
        return IDojangScroll(DOJANG_SCROLL).isVerified(account, ATTESTER_ID);
    }

    function dojangAttestation(address account) external view returns (bytes32) {
        return IDojangScroll(DOJANG_SCROLL)
            .getVerifiedAddressAttestationUid(account, ATTESTER_ID);
    }
}
