/*
Given two binary strings a and b, return their sum as a binary string.

 

Example 1:

Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
 

Constraints:

1 <= a.length, b.length <= 104
a and b consist only of '0' or '1' characters.
Each string does not contain leading zeros except for the zero itself.
*/
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = a.compactMap { Int(String($0)) }
        var b = b.compactMap { Int(String($0)) }
        
        var a_i = a.count - 1
        var b_i = b.count - 1
        var carry = 0
        var result = [Int]()
        while a_i >= 0 || b_i >= 0 {
             var val = 0
            if a_i >= 0 {
                val += a[a_i]
            }
            if b_i >= 0 {
                val += b[b_i]
            }
            val += carry
            
            result.append(val % 2)
            carry = val / 2
            
            a_i -= 1
            b_i -= 1
        } 
        
        if carry != 0 { result.append(1) }
        
        return result.reversed().map {String($0)}.joined()
    }
}