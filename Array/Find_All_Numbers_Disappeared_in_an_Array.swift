/*
Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

 

Example 1:

Input: nums = [4,3,2,7,8,2,3,1]
Output: [5,6]
Example 2:

Input: nums = [1,1]
Output: [2]
 

Constraints:

n == nums.length
1 <= n <= 105
1 <= nums[i] <= n
*/
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
         var solution = Array(repeating: 0, count: nums.count)
        for i in 1..<nums.count+1 {
            print(i-1)
            solution[i-1] = i 
        }
        for num in nums {
            solution[num-1] = -1
        }
        solution.removeAll { $0 == -1 }
        return solution
    }
}