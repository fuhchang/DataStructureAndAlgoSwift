/*
You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

You may assume that you have an infinite number of each kind of coin.

 

Example 1:

Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1
Example 2:

Input: coins = [2], amount = 3
Output: -1
Example 3:

Input: coins = [1], amount = 0
Output: 0
Example 4:

Input: coins = [1], amount = 1
Output: 1
Example 5:

Input: coins = [1], amount = 2
Output: 2
 

Constraints:

1 <= coins.length <= 12
1 <= coins[i] <= 231 - 1
0 <= amount <= 104
*/
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
       var min = Array(repeating: 0, count: amount + 1)
        return dfs(coins,amount,&min)
    }
    
    func dfs(_ coins: [Int],_ amount: Int,_ min: inout [Int]) -> Int {
        if amount < 0 { return -1 }
        if amount == 0 { return 0 }
        if min[amount] != 0 {
            return min[amount]
        }
        
        var currMin = Int.max
        
        for coin in coins {
            let prevMin = dfs(coins, amount - coin, &min)
            if 0 <= prevMin && prevMin < currMin {
                currMin = prevMin + 1
            }
        }
        min[amount] = currMin == Int.max ? -1 : currMin
        return min[amount]
    }
}