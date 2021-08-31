/*
Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

 

Example 1:

Input: nums = [0,1]
Output: 2
Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
Example 2:

Input: nums = [0,1,0]
Output: 2
Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 

Constraints:

1 <= nums.length <= 105
nums[i] is either 0 or 1.
*/

class Solution {
    var dict = [0:0, 1:0]
    func findMaxLength(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }

    var count = 0
    var indices = [0:-1]
    var maxLength = 0
        
    for i in 0..<nums.count {
        count += nums[i] == 0 ? -1 : 1
        if let previous = indices[count] {
            maxLength = max(maxLength, i - previous)
        } else {
            indices[count] = i
        }
    }
        return maxLength
    }
}