/*
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?

 

Example 1:


Input: m = 3, n = 7
Output: 28
Example 2:

Input: m = 3, n = 2
Output: 3
Explanation:
From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down
Example 3:

Input: m = 7, n = 3
Output: 28
Example 4:

Input: m = 3, n = 3
Output: 6
 

Constraints:

1 <= m, n <= 100
It's guaranteed that the answer will be less than or equal to 2 * 109.
*/
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0  { return 0 }
        var board = Array(repeating: Array(repeating:0, count: n+1) , count: m+1)
        var i = 1, j = 1
        while i <= n {
            board[1][i] = 1
            i += 1
        }
        
        while j <= m {
            board[j][1] = 1
            j += 1
        }
        var row = 2
        while row <= m {
            var col = 2
            while col <= n {
                board[row][col] += board[row-1][col] + board[row][col-1]
                col += 1
            }
            row += 1
        }
        print(board)
        return board[m][n]
    }
}