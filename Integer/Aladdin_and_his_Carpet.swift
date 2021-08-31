import Foundation
import Glibc
 
var magic = [2,4,5,2]
var dist = [4,3,1,3]
func getStartPoint(_ magic: [Int], _ dist: [Int]) -> Int {
   var s = 0, r = 0, d = 0
   for i in 0..<magic.count {
       r += magic[i] - dist[i]
       if r < 0 {
           s = i + 1
           d += r
           r = 0
       }
   }
   return d + r >= 0 ? s : -1
}

print(getStartPoint(magic, dist))