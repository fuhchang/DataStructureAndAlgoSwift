import Foundation
import Glibc

var arr = [12, 0, 3, 9, 2, 18, 8, 27, 5, 1, 21]

func twoSum(_ array: [Int], _ target: Int) -> [Int] {
    var indexes = [Int: Int]()

    for index in 0..<array.count {
        let value = array[index]
        indexes[value] = index
    }

    for index in 0..<array.count {
        let value = array[index]
        if let otherIndex = indexes[target - value],
           index != otherIndex {
            return [index, otherIndex]
        }
    }
    fatalError("Unable to match values")
}

print(twoSum(arr,  20))
