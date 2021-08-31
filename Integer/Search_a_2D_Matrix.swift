/*
Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous row.
 

Example 1:


Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true
Example 2:


Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
Output: false
 

Constraints:

m == matrix.length
n == matrix[i].length
1 <= m, n <= 100
-104 <= matrix[i][j], target <= 104
*/
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count != 0 && matrix[0].count != 0 else {
            return false
        }
        for i in 0..<matrix.count {
            if matrix[i][0] > target {
                if i == 0 {
                    return false
                }
              return helper(matrix[i-1],target,0,matrix[i-1].count)   
            }
            if i == matrix.count-1 {
                return helper(matrix[i],target,0,matrix[i].count) 
            }
        }
        return false
    }
    
    func helper(_ arr: [Int],_ target: Int,_ left: Int,_ right: Int) -> Bool {
        if left >= right {
            return false
        }
        let mid = (left + right) / 2
        if arr[mid] == target {
            return true
        } else if arr[mid] < target {
            return helper(arr, target,mid+1, right)
        } else {
            return helper(arr, target, left, mid)
        }
    }
}