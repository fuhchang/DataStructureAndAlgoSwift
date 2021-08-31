/*
For some fixed n, an array nums is beautiful if it is a permutation of the integers 1, 2, ..., n, such that:

For every i < j, there is no k with i < k < j such that nums[k] * 2 = nums[i] + nums[j].

Given n, return any beautiful array nums.  (It is guaranteed that one exists.)

 

Example 1:

Input: n = 4
Output: [2,1,4,3]
Example 2:

Input: n = 5
Output: [3,1,2,5,4]
 

Note:

1 <= n <= 1000
*/

class Solution {
    // func beautifulArray(_ n: Int) -> [Int] {
    //     var arr = [Int](repeating: 0, count: n)
    //     var res = [1]
    //     while res.count < n {
    //         var temp = [Int]()
    //         for i in res {
    //             if i * 2 - 1 <= n {
    //                 temp.append(2*i-1)
    //             }
    //         }
    //         for i in res {
    //             if (i*2<=n) {
    //                 temp.append(2*i)
    //             }
    //         }
    //         res = temp
    //     }
    //     for i in 0..<n {
    //         arr[i] = res[i]
    //     }
    //     return arr
    // }
     func beautifulArray(_ n: Int) -> [Int] {
        return helper(n)
    }
    
    func helper(_ n: Int) -> [Int] {
        if n == 1 {
            return [1]
        }
        var odds = helper(n/2+n%2) 
        var evens = helper(n/2)
        for (i, item) in odds.enumerated() {
            odds[i] = 2 * item - 1
        }
        
        for (i, item) in evens.enumerated() {
            evens[i] = 2 * item 
        }
        return odds + evens
    }
}