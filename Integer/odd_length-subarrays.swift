import Foundation
import Glibc

/*
Given an array of positive integers arr, calculate the sum of all possible odd-length subarrays.

A subarray is a contiguous subsequence of the array.

Return the sum of all odd-length subarrays of arr.



Example 1:

Input: arr = [1,4,2,5,3]
Output: 58
Explanation: The odd-length subarrays of arr and their sums are:
[1] = 1
[4] = 4
[2] = 2
[5] = 5
[3] = 3
[1,4,2] = 7
[4,2,5] = 11
[2,5,3] = 10
[1,4,2,5,3] = 15
If we add all these together we get 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58
*/

func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var size = 0
        var total = 0
        while size <= arr.count {
            for i in 0..<arr.count - size {
                total += arr[i...i+size].reduce(0, +)
            }
            size += 2
        }
        return total
}
print(sumOddLengthSubarrays([1,4,2,5,3]))
