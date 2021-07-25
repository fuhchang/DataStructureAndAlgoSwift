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
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var k = 1
        let n2 = n*n
        
        var r = 0
        var c = 0
        
        while k <= n2 {
            // go right
            while c < n && res[r][c] == 0 {
                res[r][c] = k
                k += 1
                c += 1
            }
            c -= 1
            r += 1
            
            // go down
            while r < n && res[r][c] == 0 {
                res[r][c] = k
                k += 1
                r += 1
            }
            r -= 1
            c -= 1
            
            // go left
            while c >= 0 && res[r][c] == 0 {
                res[r][c] = k
                k += 1
                c -= 1
            }
            c += 1
            r -= 1
            
            // go up
            while r >= 0 && res[r][c] == 0 {
                res[r][c] = k
                k += 1
                r -= 1
            }
            r += 1
            c += 1
        }
        
        return res
    }
}