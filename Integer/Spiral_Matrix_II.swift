/*
Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

 

Example 1:


Input: n = 3
Output: [[1,2,3],[8,9,4],[7,6,5]]
Example 2:

Input: n = 1
Output: [[1]]
 

Constraints:

1 <= n <= 20
*/
class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
     var result = [[Int]](repeating: [Int](repeating: 0, count: n), count:  n)
        var top = 0
        var btm = n - 1
        var left = 0
        var right = n - 1
        var counter  = 1
        var direction = 0
        while left <= right && top <= btm {
            if direction == 0 { // right
                for i in left...right {
                    result[top][i] = counter
                    counter += 1
                }
                top += 1
            } else if direction == 1 {
                for i in top...btm {
                    result[i][right] = counter
                    counter += 1
                }
                right -= 1
            } else if direction == 2 {
                for i in stride(from: right, through: left, by: -1) {
                    result[btm][i] = counter
                    counter += 1
                }
                btm -= 1
            } else {
                for i in stride(from: btm, through: top, by: -1) {
                    result[i][left] = counter
                    counter += 1
                }
                left += 1
            }
            direction = (direction + 1) % 4
        }
        return result
    }
}