// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntToRoman {
    struct IntRoman {
        uint num;
        string str;
    }

    // 符号表（不能用constant修饰数组结构体）
    IntRoman[] private intRomans;

    constructor() {
        intRomans.push(IntRoman(1000, "M"));
        intRomans.push(IntRoman(900, "CM"));
        intRomans.push(IntRoman(500, "D"));
        intRomans.push(IntRoman(400, "CD"));
        intRomans.push(IntRoman(100, "C"));
        intRomans.push(IntRoman(90, "XC"));
        intRomans.push(IntRoman(50, "L"));
        intRomans.push(IntRoman(40, "XL"));
        intRomans.push(IntRoman(10, "X"));
        intRomans.push(IntRoman(9, "IX"));
        intRomans.push(IntRoman(5, "V"));
        intRomans.push(IntRoman(4, "IV"));
        intRomans.push(IntRoman(1, "I"));
    }

    /**
     * @dev 将整数转换为罗马数字
     * @param number 需要转换的数字（1-3999）
     * @return 罗马数字字符串
     */
    function intToRoman(uint number) public view returns (string memory) {
        // 输入验证
        require(
            number > 0 && number < 4000,
            "IntToRoman: Number must be between 1 and 3999"
        );

        bytes memory roman;
        uint remaining = number;

        // 使用常量符号表进行转换
        for (uint i = 0; i < intRomans.length; i++) {
            uint value = intRomans[i].num;
            string memory symbol = intRomans[i].str;

            while (remaining >= value) {
                roman = abi.encodePacked(roman, symbol);
                remaining -= value;
            }

            if (remaining == 0) {
                break;
            }
        }

        return string(roman);
    }
}
