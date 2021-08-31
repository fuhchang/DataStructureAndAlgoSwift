/*
Given a balanced parentheses string s, return the score of the string.

The score of a balanced parentheses string is based on the following rule:

"()" has score 1.
AB has score A + B, where A and B are balanced parentheses strings.
(A) has score 2 * A, where A is a balanced parentheses string.
 

Example 1:

Input: s = "()"
Output: 1
Example 2:

Input: s = "(())"
Output: 2
Example 3:

Input: s = "()()"
Output: 2
Example 4:

Input: s = "(()(()))"
Output: 6
 

Constraints:

2 <= s.length <= 50
s consists of only '(' and ')'.
s is a balanced parentheses string.
*/
class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
      var stack = [String]()
      var result = 0
      for c in s {
        if (c == "(") {
          stack.append(String(c))
          continue
        }
        else {
          var top = stack.removeLast()
          var ops = [Int]()
          while top != "(" {
             ops.append(Int(top)!)
            top = stack.removeLast()
          }
          let total = ops.reduce(0, +)
          let value = max(1, total*2)
          stack.append(String(value))
        }
       }
      result = stack.map { Int($0)! }.reduce(0, +)
      return result
    }
}