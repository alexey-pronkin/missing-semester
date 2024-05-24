from typing import List
class BruteForceSolution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        result = []
        for i, n1 in enumerate(nums, 1):
            for j, n2 in enumerate(nums[i:], 1):
                if i + j - 1 >= len(nums):
                    continue
                for k, n3 in enumerate(nums[i+j:], 1):
                    if i+j+k-2 >= len(nums):
                        continue
                    for n, n4 in enumerate(nums[i+j+k:], 1):
                        if (n1+n2+n3+n4) == target:
                            result.append(tuple(sorted([n1,n2,n3,n4])))
        return set(result)
from collections import Counter

class SmartBruteForceSolution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        result = []
        nums = Counter(nums)
        left = 0
        right = len(nums)
        nums = nums.items()
        nums.sort(lambda x: x[0])
        while (left_cond:=(nums[left][0]+nums[right][0]*3 < target)) or (right_cond:=(nums[left][0]*3+nums[right][0] > target)):
            if left_cond:
                left+=1
            elif right_cond:
                right-=1
        nums = nums[left:right]
        nums = [i for j in range(min([4, n])) for (i, n) in nums]
        for i, n1 in enumerate(nums, 1):
            for j, n2 in enumerate(nums[i:], 1):
                if i + j - 1 >= len(nums):
                    continue
                for k, n3 in enumerate(nums[i+j:], 1):
                    if i+j+k-2 >= len(nums):
                        continue
                    for n, n4 in enumerate(nums[i+j+k:], 1):
                        if (n1+n2+n3+n4) == target:
                            result.append(tuple(sorted([n1,n2,n3,n4])))
        return set(result)
# class Solution:
#     def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
#         nums = sorted(nums)
#         # Brute Force
#         # Time complexity: O(2^n)
#         # Space complexity: (n)
#         res = []
#         def dfs(cur, i):
#             print(cur)
#             # base case
#             if sum(cur) == target and len(cur) == 4:
#                 if Counter(cur) not in [Counter(j) for j in res.copy()]:
#                     res.append(cur.copy())
#                     return
#             if i >= len(nums) or len(cur) >= 4:
#                 return
            
#             cur.append(nums[i])
#             while i + 1 < len(nums) and nums[i] == nums[i + 1]:
#                 i += 1
#             dfs(cur, i + 1)
#             cur.pop()
#             dfs(cur, i + 1)
        
#         dfs([], 0)
#         return res

class Solution:
    def fourSum(self, nums, target):
        def findNsum(l, r, target, N, result, results):
            if r-l+1 < N or N < 2 or target < nums[l]*N or target > nums[r]*N:  
                return
            if N == 2: 
                while l < r:
                    s = nums[l] + nums[r]
                    if s == target:
                        results.append(result + [nums[l], nums[r]])
                        l += 1
                        while l < r and nums[l] == nums[l-1]:
                            l += 1
                    elif s < target:
                        l += 1
                    else:
                        r -= 1
            else:
                for i in range(l, r+1):
                    if i == l or (i > l and nums[i-1] != nums[i]):
                        findNsum(i+1, r, target-nums[i], N-1, result+[nums[i]], results)

        nums.sort()
        results = []
        findNsum(0, len(nums)-1, target, 4, [], results)
        return results

class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        nums.sort()
        result = []
        n = len(nums)

        for i in range(n - 3):
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            
            for j in range(i + 1, n - 2):
                if j > i + 1 and nums[j] == nums[j - 1]:
                    continue
                
                left = j + 1
                right = n - 1
                
                while left < right:
                    cursum = nums[i] + nums[j] + nums[left] + nums[right]
                    
                    if cursum < target:
                        left += 1
                    elif cursum > target:
                        right -= 1
                    else:
                        result.append([nums[i], nums[j], nums[left], nums[right]])
                        
                        while left < right and nums[left] == nums[left + 1]:
                            left += 1
                        while left < right and nums[right] == nums[right - 1]:
                            right -= 1
                            
                        left += 1
                        right -= 1
        
        return result
    
class Solution:
    def fourSum(self, a: List[int], b: int) -> List[List[int]]:
        k=[]
        u=[]
        a.sort()
        def freq(a):
            #a=[1,3,2,4,1,2,3]
            f={}
            for i in range(len(a)):
                if a[i] not in f:
                    f[a[i]]=1
                else:
                    f[a[i]]+=1
            return(f)
        for i in range(len(a)):
            for  j in range(i,len(a)-1):
                l=j+1
                h=len(a)-1
                while l<h:
                    res=a[i]+a[j]+a[l]+a[h]
                    if(res==b)and (freq([a[i],a[j],a[l],a[h]]) not in u) and (i!=j!=l!=h):
                        k.append([a[i],a[j],a[l],a[h]])
                        u.append(freq([a[i],a[j],a[l],a[h]]))
                        l=l+1
                    elif res>b:
                        h=h-1
                    else:
                        l=l+1
        return(k)
class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        n = len(nums)
        nums = sorted(nums)
        result = []
        memo = set()        
        for i in range(n):
            for j in range(i + 1, n):
                k = j + 1
                l = n - 1

                while k < l:
                    total = nums[i] + nums[j] + nums[k] + nums[l]
                    curr = (nums[i], nums[j], nums[k], nums[l])
                    if total == target and curr not in memo:
                        memo.add(curr)
                        result.append(list(curr))
                        k += 1
                        l -= 1
                    elif total > target:
                        l -= 1
                    else:
                        k += 1
        return result