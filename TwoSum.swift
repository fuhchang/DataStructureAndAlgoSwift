import Foundation
import Glibc
var numbers = [12, 0, 3, 9, 2, 18, 8, 27, 5, 1, 21]

 //1. brute force
 func bruteForceTwoSum(arr: [Int], sum: Int)  {
     for i in 0..<arr.count {
         for j in 0..<arr.count where j != i {
             if (arr[i] + arr[j]) == sum {
                print("true: \(arr[j]) + \(arr[i]) = sum \(sum)")
                return
             } else {
                 print("false: \(arr[j]) + \(arr[i]) != sum \(sum)")
             }
         }
     }
 }

//  bruteForceTwoSum(arr: numbers, sum: 20)

 //2. Binary Search for compliment
 func binarySearchTwoSum(arr: [Int], sum: Int)   {
    if arr.count == 0 { return}
     for i in 0..<arr.count {
        let compliment = sum - arr[i]
        var tempArray = arr
        tempArray.remove(at: i)

        let hasCompliment = binarySearch(arr: tempArray, key: compliment)
        print("sum: \(sum) num: \(arr[i]) - \(hasCompliment)")

        if hasCompliment == true {
            print("true - (num:\(arr[i]), compliment: \(compliment))")
            return
        }
     }
 }

 func binarySearch(arr: [Int], key: Int) -> Bool {
     if arr.count == 0 { return false }
     let minIndex: Int = 0
     let maxIndex: Int = arr.count - 1
     let midIndex: Int = maxIndex/2
     let midValue = arr[midIndex]

     if key < arr[minIndex] || key > arr[maxIndex] {
         return false
     }

     if key > midValue {
         let slice = Array(arr[midIndex + 1...maxIndex])
         return binarySearch(arr: slice, key: key)
     }

      if key < midValue {
         let slice = Array(arr[minIndex...midIndex - 1])
         return binarySearch(arr: slice, key: key)
     }

     if key == midValue {
        print("Value found \(midValue) !!!!")
         return true
     }
     return false
 }
 var numbers2 = [1, 4, 6, 7, 10, 12, 18, 19, 23, 24, 44, 58, 65]
//  binarySearchTwoSum(arr: numbers2, sum: 47)
 

 //3 move pointer

 func twoSumPointer(arr: [Int], sum: Int) -> Bool {
     var lowIndex = 0
     var highIndex = arr.count - 1

     while lowIndex < highIndex {
         let sumOfItems = arr[lowIndex] + arr[highIndex]
         if sumOfItems == sum {
            print("Sum of \(arr[lowIndex]) and \(arr[highIndex]) = \(sum)")
             return true
         } else if sumOfItems > sum {
             highIndex -= 1
         } else if sumOfItems < sum {
             lowIndex += 1
         }
     }
     return false
 }

 print(twoSumPointer(arr: numbers2, sum: 20))
