// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IInkEAS {
    struct AttestationRequestData {
        address recipient;
        uint64 expirationTime;
        bool revocable;
        bytes32 refUID;
        bytes data;
        uint256 value;
    }

    struct AttestationRequest {
        bytes32 schema;
        AttestationRequestData data;
    }

    function attest(AttestationRequest calldata request) external payable returns (bytes32);
}

contract InkBuilderAttest {
    IInkEAS public immutable eas;
    bytes32 public immutable schemaUid;

    bytes32 public latestAttestationUid;
    address public latestBuilder;
    string public latestProject;
    string public latestUri;

    event BuilderAttested(bytes32 indexed uid, address indexed builder, string project, string uri);

    constructor(address easAddress, bytes32 schemaUid_) {
        require(easAddress != address(0), "eas");
        require(schemaUid_ != bytes32(0), "schema");
        eas = IInkEAS(easAddress);
        schemaUid = schemaUid_;
    }

    function publish(string calldata project, string calldata uri) external returns (bytes32 uid) {
        bytes memory data = abi.encode(msg.sender, project, uri);

        uid = eas.attest(
            IInkEAS.AttestationRequest({
                schema: schemaUid,
                data: IInkEAS.AttestationRequestData({
                    recipient: msg.sender,
                    expirationTime: 0,
                    revocable: true,
                    refUID: bytes32(0),
                    data: data,
                    value: 0
                })
            })
        );

        latestAttestationUid = uid;
        latestBuilder = msg.sender;
        latestProject = project;
        latestUri = uri;

        emit BuilderAttested(uid, msg.sender, project, uri);
    }
}
