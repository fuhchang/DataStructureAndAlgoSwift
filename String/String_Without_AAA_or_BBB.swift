/*
Given two integers a and b, return any string s such that:

s has length a + b and contains exactly a 'a' letters, and exactly b 'b' letters,
The substring 'aaa' does not occur in s, and
The substring 'bbb' does not occur in s.
 

Example 1:

Input: a = 1, b = 2
Output: "abb"
Explanation: "abb", "bab" and "bba" are all correct answers.
Example 2:

Input: a = 4, b = 1
Output: "aabaa"
 

Constraints:

0 <= a, b <= 100
It is guaranteed such an s exists for the given a and b.
*/
class Solution {
    func strWithout3a3b(_ a: Int, _ b: Int) -> String {
        let isABigger = a > b
        let len = a+b
        let placeholderChar: Character = isABigger ? "a" : "b"
        let toPlaceChar: Character = isABigger ? "b" : "a"
        let toPlaceCharCount = isABigger ? b : a
        var ans = [Character](repeating: placeholderChar, count: len)
        var j = 2
        var i = j
        for n in 0..<toPlaceCharCount {
            if i >= len {
             j -= 1
             i = j
            }
            ans[i] = toPlaceChar
            i += 3
        }
        return String(ans)
    }
}