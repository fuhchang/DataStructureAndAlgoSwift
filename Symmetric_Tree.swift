/*
Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

 

Example 1:


Input: root = [1,2,2,3,4,4,3]
Output: true
Example 2:


Input: root = [1,2,2,null,3,null,3]
Output: false
 

Constraints:

The number of nodes in the tree is in the range [1, 1000].
-100 <= Node.val <= 100
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return helper(root?.left,root?.right)
    }
    
    func helper(_ left: TreeNode?,_ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if let leftVal = left?.val, let rightVal = right?.val, leftVal == rightVal {
            let leftNode = helper(left?.left,right?.right)
            let rightNode = helper(left?.right, right?.left)
            if leftNode && leftNode == rightNode {
                return true
            }
        }
        return false
    }
}