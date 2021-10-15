/*
Given an array of strings words, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.

In the American keyboard:

the first row consists of the characters "qwertyuiop",
the second row consists of the characters "asdfghjkl", and
the third row consists of the characters "zxcvbnm".

 

Example 1:

Input: words = ["Hello","Alaska","Dad","Peace"]
Output: ["Alaska","Dad"]
Example 2:

Input: words = ["omk"]
Output: []
Example 3:

Input: words = ["adsdf","sfd"]
Output: ["adsdf","sfd"]
 

Constraints:

1 <= words.length <= 20
1 <= words[i].length <= 100
words[i] consists of English letters (both lowercase and uppercase). 
*/
class Solution {
    func findWords(_ words: [String]) -> [String] {
         let topRow = "qwertyuiop"
         let middleRow = "asdfghjkl"
         let bottomRow = "zxcvbnm"
        let validWord = words.filter {
            let lowerCase = $0.lowercased()
            guard let firstChar = lowerCase.first else { return false }
            let firstStr = String(firstChar)
            
            if topRow.contains(firstStr) {
                return check(str:lowerCase, for: topRow)
            } else if middleRow.contains(firstStr) {
                return check(str:lowerCase, for: middleRow)
            } else if bottomRow.contains(firstStr) {
                return check(str:lowerCase, for: bottomRow)
            } else {
                return false
            }
        }
        return validWord
    }
    
    func check(str:String, for row: String) -> Bool {
        for char in str {
            guard row.contains(String(char)) else {
                return false
            }
        }
        return true
    }
}