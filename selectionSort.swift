//selection sort
import Foundation
import Glibc

var arr = [21, 13, 4,32,22,3,2]

func selectionSort(_ arr: inout [Int]) {
    for i in 0..<arr.count-1 {
    var minIndex = i
        for j in i+1..<arr.count {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
        arr.swapAt(i, minIndex)
        // let temp = arr[i]
        // arr[i] = arr[minIndex]
        // arr[minIndex] = temp
        print(arr)
    }
}

selectionSort(&arr)
