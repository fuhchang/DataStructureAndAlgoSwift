/*
Given an array of integers arr of even length, return true if and only if it is possible to reorder it such that arr[2 * i + 1] = 2 * arr[2 * i] for every 0 <= i < len(arr) / 2.

 

Example 1:

Input: arr = [3,1,3,6]
Output: false
Example 2:

Input: arr = [2,1,2,6]
Output: false
Example 3:

Input: arr = [4,-2,2,-4]
Output: true
Explanation: We can take two groups, [-2,-4] and [2,4] to form [-2,-4,2,4] or [2,4,-2,-4].
Example 4:

Input: arr = [1,2,4,16,8,4]
Output: false
 

Constraints:

0 <= arr.length <= 3 * 104
arr.length is even.
-105 <= arr[i] <= 105
*/
class Solution {
    func canReorderDoubled(_ A: [Int]) -> Bool {
        guard (A.filter{ $0 == 0}.count % 2 == 0) else {
            return false
        }
        let negArr = A.filter { $0 < 0}.map {abs($0)}
        let posArr = A.filter { $0 > 0}
        return coreCanReorderDoubled(negArr) && coreCanReorderDoubled(posArr)
    }

    func coreCanReorderDoubled(_ postiveA: [Int]) -> Bool {
        var map = [Int: Int]()
        postiveA.forEach { (n) in
            map[n, default:0] += 1
        }
        var sortedA = postiveA.sorted()
        for i in 0..<sortedA.count {
            if map[sortedA[i]] == Int.min { continue }
            let vct = map[sortedA[i]]!
            let vct2 = map[sortedA[i]*2] ?? 0
            if vct > vct2 { 
                return false 
            } else if vct > 0 && vct2 > 0 {
                map[sortedA[i]]! -= 1
                map[sortedA[i]*2]! -= 1
            }
        }
        return map.values.reduce(0, +) == 0
    }

}