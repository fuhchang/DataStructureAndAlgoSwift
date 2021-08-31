/*
Given an integer numRows, return the first numRows of Pascal's triangle.

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


 

Example 1:

Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
Example 2:

Input: numRows = 1
Output: [[1]]
 

Constraints:

1 <= numRows <= 30
*/
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        var temp = [1]
        for i in 0..<numRows {
            if i == 0 {
                result.append([1])
            } else if i == 1 {
                result.append([1,1])
            } else {
                var newRow = Array(repeating: 1, count: i + 1)
                var j = 1
                while j < i {
                    let parentRow = result[i - 1]
                    newRow[j] =  parentRow[j-1] + parentRow[j]
                    j += 1
                }
                result.append(newRow)
            }
        }
        return result
    }
}