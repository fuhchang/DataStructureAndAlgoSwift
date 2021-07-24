/*
Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

Each number in candidates may only be used once in the combination.

Note: The solution set must not contain duplicate combinations.

 

Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
Example 2:

Input: candidates = [2,5,2,1,2], target = 5
Output: 
[
[1,2,2],
[5]
]
 

Constraints:

1 <= candidates.length <= 100
1 <= candidates[i] <= 50
1 <= target <= 30
*/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        guard candidates.count > 0 else { return result }
        let total = candidates.reduce(0, +)
        if total < target {
            return result
        } else if total == target {
            result.append(candidates)
            return result
        } else {
            let uniqueElements = Set(candidates)
            if uniqueElements.count == 1 {
                if total > target {
                    var temp = [Int]()
                    var remain = target
                    for item in candidates {
                        remain = remain - item
                        temp.append(item)
                        if remain == 0 {
                            result.append(temp)
                            break
                        }
                    }
                }
            } else {
                var arr = candidates.sorted()
                trace(&result,[Int](),arr, target,0)
            }
        }
        return result
    }
    
    func trace(_ result: inout [[Int]], _ list: [Int], _ candidates: [Int], _ remain: Int,_ start: Int) {
        var temp = list
        if remain < 0 {
            return
        } else if remain == 0 {
            if !result.contains(list) {
              result.append(list)   
            }
        } else {
            for i in start..<candidates.count {
                temp.append(candidates[i])
                trace(&result, temp, candidates, remain - candidates[i], i + 1)
                temp.removeLast()
            }
        }
    }
}