/*
Given an array nums of size n, return the majority element.

The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

 

Example 1:

Input: nums = [3,2,3]
Output: 3
Example 2:

Input: nums = [2,2,1,1,1,2,2]
Output: 2
 

Constraints:

n == nums.length
1 <= n <= 5 * 104
-231 <= nums[i] <= 231 - 1
*/
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict : [Int: Int] = [:]
        var highValue = 0
        var key = 0
        for num in nums {
            dict[num, default: 1] += 1
            if highValue < dict[num] ?? 0 {
                highValue = dict[num] ?? 0
                key = num
            }
        }
        return key
    }
}