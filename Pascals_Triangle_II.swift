/*
Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


 

Example 1:

Input: rowIndex = 3
Output: [1,3,3,1]
Example 2:

Input: rowIndex = 0
Output: [1]
Example 3:

Input: rowIndex = 1
Output: [1,1]
 

Constraints:

0 <= rowIndex <= 33
*/
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [[Int]]()
        for i in 0...rowIndex {
            if i == 0 {
                result.append([1])
            } else if i == 1 {
                result.append([1, 1])
            } else {
                var j = 1
                       var newRow = Array(repeating: 1, count: i + 1)
                while j < i {
                    let parent = result[i-1]
                    newRow[j] = parent[j-1] + parent[j]
                    j += 1
                }
                result.append(newRow)
            }
        }
        return result.last!
    }
}