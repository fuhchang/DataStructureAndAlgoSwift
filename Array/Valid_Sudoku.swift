/*
Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

Each row must contain the digits 1-9 without repetition.
Each column must contain the digits 1-9 without repetition.
Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.
 

Example 1:


Input: board = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: true
Example 2:

Input: board = 
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: false
Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 

Constraints:

board.length == 9
board[i].length == 9
board[i][j] is a digit or '.'.
*/
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
      return checkRow(board) && checkCol(board) && checkSquare(board)
    }
    
    func checkRow(_ board: [[Character]]) -> Bool {
        for row in board {
            guard row.count == 9 else { return false }
            if !checker(row) {
                return false
            }
            
        }
        return true
    }
    
    func checkCol(_ board: [[Character]]) -> Bool {
            for i in 0..<board.count {
                var col = [Character]()
                for j in 0..<board.count {
                    col.append(board[j][i])
                }
                guard col.count == 9 else { return false }
                if !checker(col) {
                    return false
                }
            }
        return true
    }
    
    func checkSquare(_ board: [[Character]]) -> Bool { 
        for i in [0,3,6] {
            for j in [0,3,6] {
                let squareArr = square(board, i, j)
                if !checker(squareArr) {
                    return false
                }
            }
        }
        return true
    }
    
    func square(_ board: [[Character]],_ row: Int,_ col:Int) -> [Character] {
        var squareArr = [Character]()
        for i in row..<row+3 {
            for j in col..<col+3 {
                squareArr.append(board[i][j])
            }
        }
        return squareArr
    }
    func checker(_ row: [Character]) -> Bool {
        var dict = [Character: Int]()
        for item in row {
            if item != "." && dict[item] != nil {
                return false
            }  else {
                dict[item] = 0
            }
        }
        return true
    }
}