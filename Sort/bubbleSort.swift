//bubble sort
import Foundation
import Glibc


func bubbleSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }

    var result = input
    let count = result.count
    var isSwapped = false

    repeat {
        isSwapped = false
        for index in 1..<count {
            if result[index] < result[index - 1] {
                // result.swapAt(index - 1, index)
                let temp = result[index - 1]
                result[index - 1] = result[index]
                result[index] = temp
                isSwapped = true
            }
        }
    } while isSwapped
    return result
}


var list = [5,9,3,7,1,0,4]

let result = bubbleSort(list)
print(result)
