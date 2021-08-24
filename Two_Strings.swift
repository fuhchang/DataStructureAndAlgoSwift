/*
Two String
Given two arrays of string, determine whether corresponding elements contain a common substring.
For example, if array a = [ab, cd,ed] and array b = [af, ee,ef]
*/
import Foundation
import Glibc
 
var a = ["ab","cde","efkm","gh"]
var b = ["ac","ok","dc","he"]
func twoString(_ a: [String], _ b: [String]) -> [String] {
    var res = a
    for i in 0..<a.count {
        let number = a[i].count
        var checker = 0
        for j in 0..<number {
            let value = Array(a[i])[j]
            if b[i].contains(value) {
                checker += 1
            }
        }
        if checker > 0 {
            res[i] = "YES"
        } else {
            res[i] = "NO"
        }
    }
    return res
}

print(twoString(a, b))