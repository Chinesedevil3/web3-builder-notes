// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SoneiumCreatorNote {
    string public latestNote;
    address public creator;
    uint256 public updates;

    event NotePublished(address indexed creator, string note, uint256 updates);

    function publish(string calldata note) external {
        latestNote = note;
        creator = msg.sender;
        updates += 1;
        emit NotePublished(msg.sender, note, updates);
    }
}
