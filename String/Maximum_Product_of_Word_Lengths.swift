/*
Given a string array words, return the maximum value of length(word[i]) * length(word[j]) where the two words do not share common letters. If no such two words exist, return 0.

 

Example 1:

Input: words = ["abcw","baz","foo","bar","xtfn","abcdef"]
Output: 16
Explanation: The two words can be "abcw", "xtfn".
Example 2:

Input: words = ["a","ab","abc","d","cd","bcd","abcd"]
Output: 4
Explanation: The two words can be "ab", "cd".
Example 3:

Input: words = ["a","aa","aaa","aaaa"]
Output: 0
Explanation: No such pair of words.
 

Constraints:

2 <= words.length <= 1000
1 <= words[i].length <= 1000
words[i] consists only of lowercase English letters.
*/
class Solution {
    func maxProduct(_ words: [String]) -> Int {
        if words.count < 2 { return 0 }
        let charArr = Array(97...122).map({Character(UnicodeScalar($0)!)})
        var uni: [[Character: Bool]] = []
        var res = 0
        
        for i in 0..<words.count {
            uni.append(getUniChar(charArr, words[i]))
        }
        
        for i in 0..<uni.count {
            for j in i+1..<uni.count {
                var count = 0
                for key in uni[i].keys {
                    if uni[j][key] == true { break } else { count += 1}
                    if count == uni[i].keys.count && words[i].count * words[j].count > res {
                        res = words[i].count * words[j].count
                    }
                }
            }
        }
        return res
    }
    
    func getUniChar(_ arr: [Character], _ str: String) -> [Character: Bool] {
        var temp: [Character: Bool] = [:]
        for ch in str {
            if temp[ch] == nil {
                temp[ch] = true
            }
        }
        
        return temp
    }
}