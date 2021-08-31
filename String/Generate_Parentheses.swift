/*
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 

Example 1:

Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]
Example 2:

Input: n = 1
Output: ["()"]
 

Constraints:

1 <= n <= 8
*/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        if n <= 0 {
            return result
        }
        addCombinations(&result,"",n,n)
        return result
    }
    
    func addCombinations(_ result: inout [String],_ parent: String,_ left: Int, _ right: Int) {
        if right == 0 {
            result.append(parent)
        }
        if left > 0 {
            addCombinations(&result,"\(parent)(",left - 1,right)
        }
        if right > left {
            addCombinations(&result, "\(parent))",left,right - 1)
        }
    }
}