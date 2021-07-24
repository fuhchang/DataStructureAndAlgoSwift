/*
Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

 

Example 1:

Input: num1 = "2", num2 = "3"
Output: "6"
Example 2:

Input: num1 = "123", num2 = "456"
Output: "56088"
 

Constraints:

1 <= num1.length, num2.length <= 200
num1 and num2 consist of digits only.
Both num1 and num2 do not contain any leading zero, except the number 0 itself.
*/
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
	    var arr1 = Array(num1)
        var arr2 = Array(num2)
        var sum = [Int](repeating: 0, count: arr1.count + arr2.count)
        for (i, n1) in arr1.enumerated().reversed() {
            for (j, n2) in arr2.enumerated().reversed() {
                guard let digit1 = n1.wholeNumberValue, let digit2 = n2.wholeNumberValue else { return "" } 
                let p1 = i + j
                let p2 = i + j + 1
                let val = digit1 * digit2 + sum[p2]
                sum[p2] = val % 10
                sum[p1] += val / 10
            }
            print(sum)
        }
        while let first = sum.first, first == 0 {
            sum.removeFirst()
        }
        let ans = sum.map({String($0)}).joined()
        return ans.count > 0 ? ans : "0"
    }
}
