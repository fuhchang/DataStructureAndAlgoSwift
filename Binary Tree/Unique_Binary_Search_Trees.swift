/*
Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.

 

Example 1:


Input: n = 3
Output: 5
Example 2:

Input: n = 1
Output: 1
 

Constraints:

1 <= n <= 19
*/
class Solution {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        
        var dp = [Int](repeating:0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j-1] * dp[i-j]
            }
        }
        return dp[n]
    }
}