// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract GiwaGuestbook {
    mapping(address => string) public notes;
    uint256 public totalNotes;

    event NoteSaved(address indexed writer, string note, uint256 totalNotes);

    function saveNote(string calldata note) external {
        notes[msg.sender] = note;
        totalNotes += 1;
        emit NoteSaved(msg.sender, note, totalNotes);
    }
}
