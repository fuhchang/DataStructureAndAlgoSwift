/*
Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

'.' Matches any single character.​​​​
'*' Matches zero or more of the preceding element.
The matching should cover the entire input string (not partial).

 

Example 1:

Input: s = "aa", p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
Example 2:

Input: s = "aa", p = "a*"
Output: true
Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
Example 3:

Input: s = "ab", p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".
Example 4:

Input: s = "aab", p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
Example 5:

Input: s = "mississippi", p = "mis*is*p*."
Output: false
 

Constraints:

1 <= s.length <= 20
1 <= p.length <= 30
s contains only lowercase English letters.
p contains only lowercase English letters, '.', and '*'.
It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.
*/
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if p.count == 0 {
            return s.count == 0
        }
        var s = Array(s)
        var p = Array(p)
        let sizeS = s.count
        let sizeP = p.count
        var list = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        list[0][0] = true
        for j in 1...p.count {
            if p[j - 1] == "*" {
                list[0][j] = list[0][j - 2]
            }
        }
        for i in 1..<sizeS + 1 {
            for j in 1..<sizeP + 1 {
                if p[j-1] == "." || p[j-1] == s[i-1] {
                    list[i][j] = list[i-1][j-1]
                } else if p[j-1] == "*" {
                    list[i][j] = list[i][j-2]
                    if p[j-2] == "." || p[j-2] == s[i-1] {
                        list[i][j] = list[i][j] || list[i-1][j]
                    }
                } else {
                    list[i][j] = false
                }
            }
        }
        return list[s.count][p.count]
    }
}