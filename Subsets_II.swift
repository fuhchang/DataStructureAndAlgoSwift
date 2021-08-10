/*
Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

 

Example 1:

Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
Example 2:

Input: nums = [0]
Output: [[],[0]]
 

Constraints:

1 <= nums.length <= 10
-10 <= nums[i] <= 10
*/
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var candidate = [Int]()
        helper(nums.sorted(), &result,&candidate,0)
        return result
    }
    
    func helper(_ nums: [Int], _ result: inout [[Int]],_ candidates: inout [Int],_ start: Int) {
        result.append(candidates)
        for i in start..<nums.count {
            if i == start || nums[i] != nums[i-1] {
                candidates.append(nums[i])
                helper(nums, &result, &candidates, i+1)
                candidates.removeLast()
            }
        }
    }
}