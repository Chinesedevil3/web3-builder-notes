// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract X1BuilderRegistry {
    struct Profile {
        string name;
        string profileURI;
        uint256 buildCount;
        uint256 updatedAt;
    }

    struct BuildProof {
        string project;
        string proofURI;
        uint256 createdAt;
    }

    mapping(address => Profile) public profiles;
    mapping(address => mapping(uint256 => BuildProof)) public builds;

    event ProfileRegistered(address indexed builder, string name, string profileURI);
    event BuildPublished(address indexed builder, uint256 indexed buildId, string project, string proofURI);

    function registerProfile(string calldata name, string calldata profileURI) external {
        profiles[msg.sender].name = name;
        profiles[msg.sender].profileURI = profileURI;
        profiles[msg.sender].updatedAt = block.timestamp;

        emit ProfileRegistered(msg.sender, name, profileURI);
    }

    function publishBuild(string calldata project, string calldata proofURI) external returns (uint256 buildId) {
        Profile storage profile = profiles[msg.sender];
        require(bytes(profile.name).length > 0, "register profile first");

        buildId = ++profile.buildCount;
        profile.updatedAt = block.timestamp;
        builds[msg.sender][buildId] = BuildProof({
            project: project,
            proofURI: proofURI,
            createdAt: block.timestamp
        });

        emit BuildPublished(msg.sender, buildId, project, proofURI);
    }
}
