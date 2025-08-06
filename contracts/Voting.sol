// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title 简单投票合约
/// @notice 实现基础的投票功能,包括投票、查询和重置
contract Voting {
    // 记录每个候选人获得的票数
    // key: 候选人ID, value: 获得的票数
    mapping(uint => uint) public votersCount;

    // 存储所有参与投票的候选人ID
    // 用于重置投票时遍历所有候选人
    uint[] cacheVoter;

    /// @notice 为指定候选人投票
    /// @param uid 候选人的唯一标识ID
    /// @dev 每次投票会增加候选人的票数并记录候选人ID
    function vote(uint uid) public {
        votersCount[uid] += 1;
        cacheVoter.push(uid);
    }

    /// @notice 查询指定候选人的得票数
    /// @param uid 候选人的唯一标识ID
    /// @return counts 该候选人获得的票数
    function getVotes(uint uid) public view returns (uint counts) {
        return votersCount[uid];
    }

    /// @notice 重置所有投票数据
    /// @dev 遍历缓存的候选人ID列表,将所有候选人的票数清零
    /// 同时清空候选人ID缓存数组
    function resetVotes() public {
        for (uint i = 0; i < cacheVoter.length; i++) {
            votersCount[cacheVoter[i]] = 0;
        }
        delete cacheVoter;
    }
}
