/*
Given a non-negative integer x, compute and return the square root of x.

Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.

 

Example 1:

Input: x = 4
Output: 2
Example 2:

Input: x = 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
*/
class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x < 2 { return x }
        var low = 1
        var high = x
        while low < high {
            let mid = (low + high) / 2
            let val =  mid * mid
            if val == x {
                return mid
            } else if val > x {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return low - 1
    }
}