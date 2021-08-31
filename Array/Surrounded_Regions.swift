/*
Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.

A region is captured by flipping all 'O's into 'X's in that surrounded region.

 

Example 1:


Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
Explanation: Surrounded regions should not be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
Example 2:

Input: board = [["X"]]
Output: [["X"]]
 

Constraints:

m == board.length
n == board[i].length
1 <= m, n <= 200
board[i][j] is 'X' or 'O'.
*/
class Solution {
    func solve(_ board: inout [[Character]]) {
        let m = board.count
        if m == 0 { return }
        let n = board[0].count
        
        //check rows and run dfs
        for i in stride(from: 0, to: m, by: 1) {
            if board[i][0] == "O" {
                dfs(&board, i, 0, m, n)
            }
            if board[i][n - 1] == "O" {
                dfs(&board, i, n - 1, m, n)
            }
        }
        
        //check columns and run dfs
        for j in stride(from: 0, to: n, by: 1) {
            if board[0][j] == "O" {
                dfs(&board, 0, j,m,n)
            }
            
            if board[m - 1][j] == "O" {
                dfs(&board, m - 1, j,m,n)
            }
        }
        
        //convert "*" to "O" and remaining "O" to "X"
        for i in stride(from: 0, to: m, by: 1) {
            for j in stride(from: 0, to: n, by: 1) {
                if board[i][j] == "*" {
                    board[i][j] = "O"
                } else {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    func dfs(_ board: inout [[Character]],_ i: Int,_ j: Int,_ m:Int,_ n: Int) {
        board[i][j] = "*"
        var dict: [[Int]] = [[1,0], [-1,0], [0,1], [0 ,-1]]
        
        for point in dict {
            var x = i + point[0]
            var y = j + point[1]
            if x < 0 || x >= m || y < 0 || y >= n || board[x][y] != "O" {
                continue
            }
            dfs(&board,x,y,m,n)
        }
    }
}