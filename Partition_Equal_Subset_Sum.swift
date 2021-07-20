/*
Given a non-empty array nums containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

 

Example 1:

Input: nums = [1,5,11,5]
Output: true
Explanation: The array can be partitioned as [1, 5, 5] and [11].
Example 2:

Input: nums = [1,2,3,5]
Output: false
Explanation: The array cannot be partitioned into equal sum subsets.
 

Constraints:

1 <= nums.length <= 200
1 <= nums[i] <= 100
*/

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var total = nums.reduce(0, +)
        guard total % 2 == 0 else { return false }
        var hashMap: [String: Bool] = [:]
        return helper(nums, 0, 0, total, &hashMap)
    }
    
    func helper(_ nums: [Int], _ i: Int, _ sum: Int, _ total: Int,_ state: inout [String: Bool]) -> Bool {
        var current: String = "\(i) \(sum)"
        if let val = state[current] {
            return val
        }
        if (sum * 2) == total {
            return true
        }
        if sum > (total/2) || i >= nums.count {
            return false
        }
        
        var foundPart: Bool = helper(nums, i + 1, sum, total, &state) || helper(nums, i + 1, sum + nums[i], total, &state)
        state[current] = foundPart
        return foundPart
    }
}