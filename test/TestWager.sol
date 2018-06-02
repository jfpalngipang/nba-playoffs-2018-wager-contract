pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Wager.sol";

contract TestWager {
    Wager wager = Wager(DeployedAddresses.Wager());

    // test if participant can bet on a team
    function testUserCanBet() public {
        uint returnedId = wager.bet(0, 500);

        uint expected = 0;

        Assert.equal(returnedId, expected, "Bet on team 0 should be recorded");
    }

    function testGetParticipantAddressByTeamId() public {
        address expected = this;

        address participant = wager.getParticipantByTeamId(0);

        Assert.equal(participant, expected, "Participantswith bet on team 0 should be recorded");
    }

    function testGetAllParticipants() public {
        address expected = this;

        address[16] memory participants = wager.getParticipants();

        Assert.equal(participants[0], expected, "Participants with bet on team 0 should be recorded");
    }
}