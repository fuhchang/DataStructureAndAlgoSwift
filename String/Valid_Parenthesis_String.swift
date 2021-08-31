/*
Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.

The following rules define a valid string:

Any left parenthesis '(' must have a corresponding right parenthesis ')'.
Any right parenthesis ')' must have a corresponding left parenthesis '('.
Left parenthesis '(' must go before the corresponding right parenthesis ')'.
'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".
 

Example 1:

Input: s = "()"
Output: true
Example 2:

Input: s = "(*)"
Output: true
Example 3:

Input: s = "(*))"
Output: true
 

Constraints:

1 <= s.length <= 100
s[i] is '(', ')' or '*'.
*/
class Solution {
func checkValidString(_ s: String) -> Bool {
    // balance of left parenthesis and right parenthesis
    var leftBalance = 0, rightBalance = 0
    let count = s.count
    let startIndex = s.startIndex
    let endIndex = s.endIndex
    for i in 0..<count {
        // if char is ( or * - we increment leftBalance value, else decrement it
        if "*(".contains(s[s.index(startIndex, offsetBy: i)]) {
            leftBalance += 1
        } else {
            leftBalance -= 1
        }
        // check right balance value starting from right to left
        if "*)".contains(s[s.index(endIndex, offsetBy: -i - 1)]) {
            rightBalance += 1
        } else {
            rightBalance -= 1
        }
        
        if leftBalance < 0 || rightBalance < 0 {
            return false
        }
    }
    return true
}
}