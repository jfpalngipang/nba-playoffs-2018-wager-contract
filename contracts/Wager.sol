pragma solidity ^0.4.23;

contract Wager {
    address[16] public participants;

    function bet(uint teamId, uint amount) public returns (uint) {
        require(teamId >= 0 && teamId <= 15 && amount >= 500);

        participants[teamId] = msg.sender;

        return teamId;
    }

    function getParticipants() public view returns (address[16]) {
        return participants;
    }

    function getParticipantByTeamId(uint teamId) public view returns (address) {
        return participants[teamId];
    }
}