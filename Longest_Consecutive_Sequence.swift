/*
Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time.

 

Example 1:

Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
Example 2:

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
 

Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109
*/
class Solution {
       func longestConsecutive(_ nums: [Int]) -> Int {
        var longest = 0

        let numSet = Set(nums)
        var seen = Set<Int>()

        for num in nums {
            if seen.contains(num) { 
                continue 
            }

            var length = 1
            var prev = num - 1
            var next = num + 1

            seen.insert(num)

            while numSet.contains(prev) {
                seen.insert(prev)
                length += 1
                prev -= 1
            }

            while numSet.contains(next) {
                seen.insert(next)
                length += 1
                next += 1
            }

            longest = max(longest, length)   
        }

        return longest
    }
}