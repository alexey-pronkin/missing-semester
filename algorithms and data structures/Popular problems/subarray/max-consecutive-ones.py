from typing import List
# https://leetcode.com/problems/max-consecutive-ones
class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        max_len = -1
        curr_len = 0
        for i in range(len(nums)):
            if nums[i]:
                curr_len += 1
            else:
                curr_len = 0
            if curr_len > max_len:
                max_len = curr_len
        return max_len

class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        max_len = -1
        curr_len = 0
        for i in nums:
            if i:
                curr_len += 1
            else:
                curr_len = 0
            if curr_len > max_len:
                max_len = curr_len
        return max_len