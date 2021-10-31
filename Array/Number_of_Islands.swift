/*
Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 

Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1
Example 2:

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
 

Constraints:

m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] is '0' or '1'.
*/
struct Cell: Hashable {
    var row: Int
    var col: Int
    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var visited = Set<Cell>()
        var result = 0
        for i in 0..<grid.count {
            for  j in 0..<grid[0].count {
                for j in 0..<grid[0].count {
                    if grid[i][j] == "1" && !visited.contains(Cell(i,j)) {
                        result += 1
                        dfs(i, j, &visited, grid)
                    }
                }
            }
        }
        return result
    }
    
    func dfs(_ row: Int,_ col: Int,_ visited: inout Set<Cell>, _ grid: [[Character]]) {
        visited.insert(Cell(row,col))
        for (row2, col2) in [(row + 1, col), (row - 1, col), (row, col + 1), (row, col - 1)] {
            guard 0 <= row2 && row2 < grid.count && 0 <= col2 && col2 < grid[0].count else {
                continue
            }
            
            if grid[row2][col2] == "1" && !visited.contains(Cell(row2, col2)) {
                 dfs(row2, col2, &visited, grid)
            }
        }
    }
}