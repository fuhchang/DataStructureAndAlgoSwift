/*
Given a triangle array, return the minimum path sum from top to bottom.

For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

 

Example 1:

Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
Output: 11
Explanation: The triangle looks like:
   2
  3 4
 6 5 7
4 1 8 3
The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
Example 2:

Input: triangle = [[-10]]
Output: -10
 

Constraints:

1 <= triangle.length <= 200
triangle[0].length == 1
triangle[i].length == triangle[i - 1].length + 1
-104 <= triangle[i][j] <= 104
*/
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 0 {
            return 0
        }
        if triangle.count == 1 {
            var minNum = Int.max
            for num in triangle[0] {
                minNum = min(minNum, num)
            }
            return minNum
        }
        let rowCount = triangle.count
        var dp = [Int](repeating: 0, count: rowCount + 1)
        
        for i in stride(from: rowCount - 1, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
            }
        }
        return dp[0]
    }
}