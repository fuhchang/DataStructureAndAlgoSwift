/*
Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

 

Example 1:

Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
Example 2:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 

Constraints:

1 <= nums.length <= 8
-10 <= nums[i] <= 10
*/
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
     var result = [[Int]]()
        var isVisited = Array(repeating: false, count: nums.count)
        var candidiates = [Int]()
        let sorted = nums.sorted()
        possibleDup(sorted,&candidiates,&result, &isVisited)
        return result
    }
    
    func possibleDup(_ nums: [Int], _ permu: inout [Int],_ result: inout [[Int]], _  isVisited: inout [Bool]) {
        if permu.count == nums.count {
            result.append(permu)
            return
        }
        for i in 0..<nums.count where !isVisited[i] {
            if i > 0 && nums[i-1] == nums[i] && isVisited[i-1] { continue }
            permu.append(nums[i])
             isVisited[i] = true
            possibleDup(nums, &permu, &result, &isVisited)
            permu.removeLast()
             isVisited[i] = false
        }
    }
}