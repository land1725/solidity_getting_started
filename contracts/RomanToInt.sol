// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RomanToInt {
    mapping(bytes1 => uint) public SYMBOL_VALUES;
    constructor() {
        // 部署时自动初始化
        SYMBOL_VALUES["I"] = 1;
        SYMBOL_VALUES["V"] = 5;
        SYMBOL_VALUES["X"] = 10;
        SYMBOL_VALUES["L"] = 50;
        SYMBOL_VALUES["C"] = 100;
        SYMBOL_VALUES["D"] = 500;
        SYMBOL_VALUES["M"] = 1000;
    }
    function toInt(string calldata s) public view returns (int) {
        bytes memory bytesInput = bytes(s);
        int ans = 0;
        uint n = bytesInput.length;
        for (uint i; i < n; i++) {
            uint value = SYMBOL_VALUES[bytesInput[i]];
            if (i < n - 1 && value < SYMBOL_VALUES[bytesInput[i + 1]]) {
                ans -= int(value);
            } else {
                ans += int(value);
            }
        }
        return ans;
    }
}
