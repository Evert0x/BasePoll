//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import "./interfaces/IBasePoll.sol";
import "./storage/LibBasePollStorage.sol";

contract BasePoll is IBasePoll {
    constructor() public {
        LibBasePollStorage.BasePollStorage storage poll = LibBasePollStorage
            .basePollStorageId(1);
        poll.id = 1;
        poll.startTime = block.timestamp;
        poll.endTime = block.timestamp + 1;
        poll.yesCounter = 1;
        poll.noCounter = 2;
        poll.totalVoted = 3;
    }

    function getStartTime(uint256 _id)
        external
        override
        view
        returns (uint256)
    {
        return LibBasePollStorage.basePollStorageId(_id).startTime;
    }

    function getEndTime(uint256 _id) external override view returns (uint256) {
        return LibBasePollStorage.basePollStorageId(_id).endTime;
    }

    function getYesCounter(uint256 _id)
        external
        override
        view
        returns (uint256)
    {
        return LibBasePollStorage.basePollStorageId(_id).yesCounter;
    }

    function getNoCounter(uint256 _id)
        external
        override
        view
        returns (uint256)
    {
        return LibBasePollStorage.basePollStorageId(_id).noCounter;
    }

    function getTotalVoted(uint256 _id)
        external
        override
        view
        returns (uint256)
    {
        return LibBasePollStorage.basePollStorageId(_id).totalVoted;
    }

    function getVoteByAddress(uint256 _id, address _address)
        external
        override
        view
        returns (LibBasePollStorage.Vote memory)
    {
        return
            LibBasePollStorage.basePollStorageId(_id).votesByAddress[_address];
    }
}
