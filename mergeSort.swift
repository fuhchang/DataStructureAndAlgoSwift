//merge sort
import Foundation
import Glibc

var arr = [21, 13, 4,32,22,3,2, 5,7,1,10,50,23]

//Split Arrays
func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }

    let leftArr = Array(arr[0..<arr.count/2])
    let rightArr = Array(arr[arr.count/2..<arr.count])
    return merge(left: mergeSort(arr:leftArr), right: mergeSort(arr:rightArr))
}

//Merge Arrays
func merge(left: [Int], right: [Int]) -> [Int] {

    var mergedArray: [Int] = []
    var left = left
    var right = right

    while left.count > 0 && right.count > 0 {
        if left.first ?? 0 < right.first ?? 0 {
            mergedArray.append(left.removeFirst())
        } else {
             mergedArray.append(right.removeFirst())
        }
    }
    return mergedArray + left + right
}

print(mergeSort(arr: arr))
