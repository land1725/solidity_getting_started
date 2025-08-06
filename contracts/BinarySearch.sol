// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BinarySearch {
    function search(int[] memory nums, int target) public pure returns (int) {
        int left = 0;
        int right = int(nums.length) - 1;
        while (left <= right) {
            int mid = (right - left) / 2 + left;
            int num = nums[uint(mid)];
            if (num == target) {
                return mid;
            } else if (num > target) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        return -1;
    }
}
