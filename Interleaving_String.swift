/*
Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.

An interleaving of two strings s and t is a configuration where they are divided into non-empty substrings such that:

s = s1 + s2 + ... + sn
t = t1 + t2 + ... + tm
|n - m| <= 1
The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
Note: a + b is the concatenation of strings a and b.

 

Example 1:


Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
Output: true
Example 2:

Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
Output: false
Example 3:

Input: s1 = "", s2 = "", s3 = ""
Output: true
 

Constraints:

0 <= s1.length, s2.length <= 100
0 <= s3.length <= 200
s1, s2, and s3 consist of lowercase English letters.
*/
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var cache = [[String]: Bool]()
        return helper(s1, s2, s3, &cache)
    }
    
    func helper(_ s1: String,_ s2: String,_ s3: String,_ cache: inout [[String]: Bool]) -> Bool {
        if s1.isEmpty && s2.isEmpty {
            return s3.isEmpty 
        } else if s1.isEmpty || s2.isEmpty {
            return s3 == s1 + s2
        }
        
        guard s1.count + s2.count == s3.count else { return false }
        
        let key = [s1, s2, s3]
        if let result = cache[key] {
            return result
        }
        
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
        if s1[0] == s3[0] && helper(String(s1.dropFirst()), String(s2), String(s3.dropFirst()), &cache) {
            cache[key] = true
            return true
        }
        if s2[0] == s3[0] && helper(String(s1), String(s2.dropFirst()), String(s3.dropFirst()), &cache) {
            cache[key] = true
            return true
        }
        cache[key] = false
        return false
    }
}