/*
Given an integer array nums of unique elements, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

 

Example 1:

Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
Example 2:

Input: nums = [0]
Output: [[],[0]]
 

Constraints:

1 <= nums.length <= 10
-10 <= nums[i] <= 10
All the numbers of nums are unique.
*/
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]
        for i in 0..<nums.count {
            helper(nums,&result, i+1, [nums[i]])
        }
        return result
    }
    
    func helper(_ nums: [Int], _ result: inout [[Int]], _ index: Int, _ current: [Int]) {
        if index >= nums.count {
            result.append(current)
            return
        }
        helper(nums,&result,index+1, current)
        helper(nums,&result,index+1, current + [nums[index]])
    }
}