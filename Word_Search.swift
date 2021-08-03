/*
Given an m x n grid of characters board and a string word, return true if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

 

Example 1:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true
Example 2:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true
Example 3:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false
 

Constraints:

m == board.length
n = board[i].length
1 <= m, n <= 6
1 <= word.length <= 15
board and word consists of only lowercase and uppercase English letters.
*/
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 {
            return false
        }
        let n = board.count
        let m = board[0].count
        let chars = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == chars[0] && helper(board,chars,i, j,0, &visited) {
                    return true
                }
            }
        }
        return false
    }
    
    func helper(_ board: [[Character]],_ chars: [Character],_ i: Int, _ j: Int,_ index: Int,_ visited: inout [[Bool]]) -> Bool {
        if index == chars.count {
            return true
        }
        let n = board.count
        let m = board[0].count
        if i < 0 || i >= n || j < 0 || j >= m || board[i][j] != chars[index] || visited[i][j] {
            return false
        }
        visited[i][j] = true
        if helper(board,chars,i-1, j,index + 1, &visited) ||
        helper(board,chars,i+1, j,index + 1, &visited) ||
        helper(board,chars,i, j-1,index + 1, &visited) ||
        helper(board,chars,i,j+1,index + 1, &visited) {
            return true
        }
        visited[i][j] = false
        
        return false
    }
}