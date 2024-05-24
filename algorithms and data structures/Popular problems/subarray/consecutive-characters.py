# https://leetcode.com/problems/consecutive-characters/
class Solution:
    def maxPower(self, s: str) -> int:
        last_letter = -1
        max_len = -1
        curr_len = 0
        for i in s:
            if i == last_letter:
                curr_len += 1
            else:
                curr_len = 1
                last_letter = i
            if curr_len > max_len:
                max_len = curr_len
        return max_len