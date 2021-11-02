/*
Given an integer array nums and two integers k and t, return true if there are two distinct indices i and j in the array such that abs(nums[i] - nums[j]) <= t and abs(i - j) <= k.

 

Example 1:

Input: nums = [1,2,3,1], k = 3, t = 0
Output: true
Example 2:

Input: nums = [1,0,1,1], k = 1, t = 2
Output: true
Example 3:

Input: nums = [1,5,9,1,5,9], k = 2, t = 3
Output: false
 

Constraints:

0 <= nums.length <= 2 * 104
-231 <= nums[i] <= 231 - 1
0 <= k <= 104
0 <= t <= 231 - 1
*/
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if nums.isEmpty || nums.count < 2 {
           return false
       }
        var indices = [Int](0..<nums.count)
        indices = indices.sorted(by: {a,b in nums[a] < nums[b]})
        for i in 0..<nums.count {
            var x = indices[i]
            for j in (i + 1)..<nums.count {
                var y = indices[j]
                var diffNums = nums[y] - nums[x]
                var diffIndex = abs(x - y)
                if diffNums > t {
                    break
                }
                if diffIndex <= k {
                    return true
                }
            }
        }
        return false
    }
}