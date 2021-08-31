/*
Given a string s containing only digits, return all possible valid IP addresses that can be obtained from s. You can return them in any order.

A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single dots and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses. 

 

Example 1:

Input: s = "25525511135"
Output: ["255.255.11.135","255.255.111.35"]
Example 2:

Input: s = "0000"
Output: ["0.0.0.0"]
Example 3:

Input: s = "1111"
Output: ["1.1.1.1"]
Example 4:

Input: s = "010010"
Output: ["0.10.0.10","0.100.1.0"]
Example 5:

Input: s = "101023"
Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
 

Constraints:

0 <= s.length <= 3000
s consists of digits only.
*/
class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var result = [String]()
        let strArr = Array(s)
        if strArr.count < 4 || strArr.count > 12 {
            return result
        }
        var candidate = [String]()
        helper(strArr,0, &candidate, &result)
        return result
    }
    
    func helper(_ characters: [Character],_ index: Int,_ candidate: inout [String],_ result: inout [String]) {
        if candidate.count == 4 {
            result.append(candidate.joined(separator: "."))
            return
        }
        
        let charsLeft = characters.count - index
        let groupLeft = 4 - candidate.count
        let minLen = groupLeft == 1 ? charsLeft - groupLeft + 1 : 1
        let maxLen = characters[index] == "0" ? 1 : min(3, charsLeft - groupLeft + 1)
        if minLen > maxLen {
            return
        }
        
        for i in minLen...maxLen {
            let num = String(characters[index..<(index + i)])
            if Int(num) ?? 0 > 255 {
               continue
            }
            candidate.append(num)
            helper(characters,index + i,&candidate,&result)
            candidate.removeLast()
        }
    }
}