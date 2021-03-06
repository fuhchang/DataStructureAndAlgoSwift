/*
Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).

The replacement must be in place and use only constant extra memory.

 

Example 1:

Input: nums = [1,2,3]
Output: [1,3,2]
Example 2:

Input: nums = [3,2,1]
Output: [1,2,3]
Example 3:

Input: nums = [1,1,5]
Output: [1,5,1]
Example 4:

Input: nums = [1]
Output: [1]
 

Constraints:

1 <= nums.length <= 100
0 <= nums[i] <= 100
*/
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
         guard nums.count > 1 else { return}
        var i = nums.count - 1
        while (i > 0 && nums[i] <= nums[i - 1]) {
            i -= 1
        }
        if i == 0 { 
            nums.reverse()
            return 
        }
        var sub = Array(nums[i...nums.count - 1]).reversed()
        let next = Array(sub).index(where: {$0 > nums[i - 1]})! + i
       nums.replaceSubrange(i..<nums.count, with: sub)
       nums.swapAt(i - 1, next)
    }
}