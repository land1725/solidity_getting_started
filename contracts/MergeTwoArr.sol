// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MergeTwoArr {
    function mergeArr(
        int[] memory num1,
        int[] memory num2
    ) public pure returns (int[] memory) {
        uint m = num1.length;
        uint n = num2.length;
        int[] memory sorted = new int[](m + n); // 预先分配内存大小
        uint p1 = 0;
        uint p2 = 0;
        uint current = 0; // 用于跟踪sorted数组的当前位置

        while (p1 < m || p2 < n) {
            if (p1 == m) {
                // num1已经处理完，直接添加num2的剩余元素
                sorted[current] = num2[p2];
                p2++;
            } else if (p2 == n) {
                // num2已经处理完，直接添加num1的剩余元素
                sorted[current] = num1[p1];
                p1++;
            } else {
                // 比较两个数组的当前元素，选择较小的一个
                if (num1[p1] <= num2[p2]) {
                    sorted[current] = num1[p1];
                    p1++;
                } else {
                    sorted[current] = num2[p2];
                    p2++;
                }
            }
            current++;
        }

        return sorted;
    }
}
