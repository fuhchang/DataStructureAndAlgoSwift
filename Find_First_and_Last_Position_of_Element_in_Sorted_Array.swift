/*
34. Find First and Last Position of Element in Sorted Array
Medium

6413

218

Add to List

Share
Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

 

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
Example 3:

Input: nums = [], target = 0
Output: [-1,-1]
 

Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109
nums is a non-decreasing array.
-109 <= target <= 109
*/
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var i = 0
        var j = nums.count - 1
        var isJFound: Bool = false
        var isIFound: Bool = false
        var ans = [Int]()
        while i <= j {
            if nums[i] == target && !isIFound  {
                ans.append(i)
                isIFound = true
            } 
            if nums[j] == target && !isJFound {
                ans.append(j)
                isJFound = true
            } 
            if nums[i] < target {
                i += 1
            }
            if nums[j] > target {
                j -= 1
            } 
            if ans.count == 2 {
                break
            }
        }
        if ans.count == 0 {
            ans = [-1, -1]
        }
        return ans.sorted()
    }
}