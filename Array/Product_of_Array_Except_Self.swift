/*
Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.

 

Example 1:

Input: nums = [1,2,3,4]
Output: [24,12,8,6]
Example 2:

Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]
 

Constraints:

2 <= nums.length <= 105
-30 <= nums[i] <= 30
The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
*/
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return []
        }
        
        var result: [Int] = Array(repeating: 1, count: nums.count)
        var product = 1
        for i in 0..<nums.count {
            result[i] = product
            product *= nums[i]
        }
        product = 1
        
        for i in (0..<nums.count).reversed() {
            result[i] *= product
            product *= nums[i]
        }
        return result
    }
}