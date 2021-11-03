/*
Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

 

Example 1:

Input: nums = [3,2,3]
Output: [3]
Example 2:

Input: nums = [1]
Output: [1]
Example 3:

Input: nums = [1,2]
Output: [1,2]
 

Constraints:

1 <= nums.length <= 5 * 104
-109 <= nums[i] <= 109
*/
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var numDict = [Int: Int]()
        var result = [Int]()
        for num in nums {
            numDict[num, default:0] += 1
        }
        
        for item in numDict {
           if item.value > (nums.count/3) {
               result.append(item.key)
           }
        }
        return result
    }
}