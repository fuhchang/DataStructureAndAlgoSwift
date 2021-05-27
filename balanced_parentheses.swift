import Foundation
import Glibc
 
var strValue: String = "[({})]"
var strValue2: String = ")[({}]"
let openingSymbolList = ["[", "{", "("]
let closingSymbolList = ["]", "}", ")"]
func BalancedParenthesesChecker(s: String) -> Bool {
    var charStackList = [String]()
    for char in s {
        let strChar = "\(char)"
        if openingSymbolList.contains(strChar) {
            charStackList.append(strChar)
        } else {
            if charStackList.isEmpty {
                return false
            } else {
               if let index = closingSymbolList.index(of: strChar) {
               let openSymbol =  openingSymbolList[index]
                if strChar == closingSymbolList[index] && openSymbol == charStackList.last {
                    _ = charStackList.popLast()
                }
               }  
            } 
        }
    }
    return charStackList.count == 0 ? true : false
}

print(BalancedParenthesesChecker(s: strValue))
print(BalancedParenthesesChecker(s: strValue2))