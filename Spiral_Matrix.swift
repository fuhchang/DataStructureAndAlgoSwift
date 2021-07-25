/*
Given an m x n matrix, return all elements of the matrix in spiral order.

 

Example 1:


Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,3,6,9,8,7,4,5]
Example 2:


Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 

Constraints:

m == matrix.length
n == matrix[i].length
1 <= m, n <= 10
-100 <= matrix[i][j] <= 100
*/

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
         var result = [Int]()
        var top = 0
        var btm = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        var direction = 0
        
        while left <= right && top <= btm {
            //go right
            if direction == 0 {
                for i in left...right {
                    result.append(matrix[top][i])
                }
                top += 1
            } else if direction == 1 { // go down
                for i in top...btm {
                    result.append(matrix[i][right])
                }
                right -= 1
            } else if direction == 2 { //go left\
                for i in stride(from:right, through: left, by: -1) {
                    result.append(matrix[btm][i])
                }
                btm -= 1
            } else { //go up
                for i in stride(from: btm, through: top, by: -1) {
                    result.append(matrix[i][left])
                }
                left += 1
            }
            direction = (direction + 1) % 4
        }
        return result
    }
}