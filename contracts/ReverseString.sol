// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RevertString {
    function revertString(
        string memory input
    ) public pure returns (string memory) {
        bytes memory inputBytes = bytes(input);
        bytes memory outputBytes = new bytes(inputBytes.length);

        for (uint i = 0; i < inputBytes.length; i++) {
            outputBytes[i] = inputBytes[inputBytes.length - 1 - i]; // 反转字符串数组
        }
        return string(outputBytes);
    }
}
