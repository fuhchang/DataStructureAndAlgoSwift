/*
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array.

 

Example 1:

Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]
Example 2:

Input: nums = [0]
Output: [0]
 

Constraints:

1 <= nums.length <= 104
-231 <= nums[i] <= 231 - 1
*/
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroList = [Int]()
        var i = 0
        while i < nums.count {
            if nums[i] == 0 {
                nums.remove(at: i)
                zeroList.append(0)
                i -= 1
            }
            i += 1
        }
        nums = nums + zeroList
    }
}