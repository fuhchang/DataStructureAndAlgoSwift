import UIKit

let array = ["Red", "Blue", "Green", "Red", "Blue", "Yellow", "Orange", "Red", "Yellow", "Pink", "Red", "Blue"]

var dict: [String: Int] = [:]
func filterSock() {
    for sock in array {
        dict[sock, default:0] += 1
    }
    let result = dict.mapValues { value in
        return value/2
    }
    
    Swift.print(result)
}

filterSock()
