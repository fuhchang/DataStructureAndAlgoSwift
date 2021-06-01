import Foundation
import Glibc

var numArrList = [12, 0, 3, 9, 2, 18, 8, 27, 5, 1, 21]

class InsetionSort {

    func sort(arr: [Int]) -> [Int] {
     var numList = arr
        for i in 1..<numList.count {
            let key = arr[i]
            var j = i - 1

            while (j >= 0 && numList[j] > key) {
                numList[j + 1] = numList[j]
                j = j - 1
            }
            numList[j + 1] = key
        }
        return numList
    }
}

let insetionSort = InsetionSort()
var sortedList = insetionSort.sort(arr: numArrList)
print(sortedList)
