/*
You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water.

Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

 

Example 1:


Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
Output: 16
Explanation: The perimeter is the 16 yellow stripes in the image above.
Example 2:

Input: grid = [[1]]
Output: 4
Example 3:

Input: grid = [[1,0]]
Output: 4
 

Constraints:

row == grid.length
col == grid[i].length
1 <= row, col <= 100
grid[i][j] is 0 or 1.
There is exactly one island in grid.
*/

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var res = 0
        grid.enumerated().forEach { i, list in
            list.enumerated().forEach { j, value in
                guard value == 1 else {return }
                res += hasValue(i,j-1, grid) ? 0 : 1
                res += hasValue(i,j+1, grid) ? 0 : 1
                res += hasValue(i + 1,j, grid) ? 0 : 1
                res += hasValue(i - 1,j, grid) ? 0 : 1
            }
        }
        return res
    }
    
    func hasValue(_ i: Int,_ j: Int, _ grid: [[Int]]) -> Bool {
        guard 0 <= i, i < grid.count, 0 <= j, j < grid.first?.count ?? 0 else {
            return false
        }
        return grid[i][j] == 1
    }
}