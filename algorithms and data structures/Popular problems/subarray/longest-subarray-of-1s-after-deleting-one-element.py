# задача 1
from typing import List
# https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/
class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        max_len = -1
        first_zero = -1
        curr_len = 0
        flag = 0
        i = 0
        while i < len(nums):
            if nums[i] == 0:
                if flag:
                    i = first_zero + 1
                    flag = 0
                    curr_len = 0
                else:
                    flag = 1
                    first_zero = i
                    i += 1          
            else:
                curr_len += 1
                i += 1
            if curr_len > max_len:
                max_len = curr_len
        if first_zero == -1:
            return max_len - 1    
        else:
            return max_len
    def tests(self):
        assert maxOnes([1, 1, 0, 1]) == 3
        assert maxOnes([1, 1, 0, 0, 1]) == 2
        assert maxOnes([1, 0, 1, 0, 1, 1]) == 3
        assert maxOnes([0, 1]) == 1
        assert maxOnes([1, 1]) == 1
        assert maxOnes([1, 1, 1]) == 2
        assert maxOnes([0, 0, 0]) == 0

        
def maxOnes(nums:int) -> int:
    max_len = -1
    first_zero = -1
    curr_len = 0
    flag = 0
    i = 0
    while i < len(nums):
        if nums[i] == 0:
            if flag:
                i = first_zero + 1
                flag = 0
                curr_len = 0
            else:
                flag = 1
                first_zero = i
                i += 1          
        else:
            curr_len += 1
            i += 1
        if curr_len > max_len:
            max_len = curr_len
    print(max_len)
    if first_zero == -1:
        return max_len - 1    
    else:
        return max_len

assert maxOnes([1, 1, 0, 1]) == 3
assert maxOnes([1, 1, 0, 0, 1]) == 2
assert maxOnes([1, 0, 1, 0, 1, 1]) == 3


assert maxOnes([1, 1, 0, 1]) == 3
assert maxOnes([1, 1, 0, 0, 1]) == 2
assert maxOnes([1, 0, 1, 0, 1, 1]) == 3
assert maxOnes([0, 1]) == 1
assert maxOnes([1, 1]) == 1
assert maxOnes([1, 1, 1]) == 2
assert maxOnes([0, 0, 0]) == 0