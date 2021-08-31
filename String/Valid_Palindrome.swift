/*
Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 

Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Example 2:

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
 

Constraints:

1 <= s.length <= 2 * 105
s consists only of printable ASCII characters.
*/
class Solution {
   func isPalindrome(_ s: String) -> Bool {
        if(s.isEmpty || s.count == 1){return true}
    
    var input = s
    let unsafeChars = CharacterSet.alphanumerics.inverted
    input  = input.components(separatedBy: unsafeChars).joined(separator: "").lowercased()
    let inputArray = Array(input)
    var i = 0
    var j = inputArray.count - 1
    while (i < j) {
        if(inputArray[i] != inputArray[j]) {
            return false
        }
        i += 1
        j -= 1
    }
    return true
    }
}