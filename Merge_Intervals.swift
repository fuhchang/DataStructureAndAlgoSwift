/*
Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

 

Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 

Constraints:

1 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 104
*/
//faster
class Solution {
     func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        guard intervals.count > 1 else { return intervals}
        let sorted = intervals.sorted(by: {$0[0] < $1[0]})
        result.append(sorted.first!)
        for i in 1..<sorted.count {
            let prevStart = result.last![0]
            let prevEnd = result.last![1]
            let currStart = sorted[i][0]
            let currEnd = sorted[i][1]
            if prevEnd >= currStart && prevEnd <= currEnd {
                    result.removeLast()
                    result.append([prevStart,currEnd])
                } else if prevEnd < currEnd {
                    result.append([currStart,currEnd])
                } 
        }
        return result
    }
}
// slower solution
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        guard intervals.count > 1 else { return intervals}
        let sorted = intervals.sorted(by: {$0.first! < $1.first!})
        result.append(sorted[0])
        for i in 1..<sorted.count {
            let arr1 = showFullRange(result.last!)
            let arr2 = showFullRange(sorted[i])
            if arr1 != arr2 {
               if checkInterval(arr1 ,arr2) {
                    let max = (arr1.max()! > arr2.max()!) ? arr1.max()! : arr2.max()!
                    let min = (arr1.min()! < arr2.min()!) ? arr1.min()! : arr2.min()!
                    result.removeLast()
                    result.append([min,max])
                } else {
                    result.append(sorted[i])
                }  
            } 
        }
        return result
    }
    
    func checkInterval(_ arr: [Int], _ arr2: [Int]) -> Bool {
        if arr == arr2 {
            return false
        }
         let start = arr2.first ?? 0
        let end = arr2.last ?? 0
       for i in 0..<arr.count {
           if arr[i] >= start && arr[i] <= end {
               return true
           }
       }
        return false
    }
    
    func showFullRange(_ arr: [Int]) -> [Int] {
        var filterList = [Int]()
        var start = arr.first ?? 0
        var end = arr.last ?? 0
        if start == end {
            return arr
        }
        for i in start...end {
            filterList.append(i)
        }
        return filterList
    }
}