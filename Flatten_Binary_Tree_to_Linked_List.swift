/*
Given the root of a binary tree, flatten the tree into a "linked list":

The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
The "linked list" should be in the same order as a pre-order traversal of the binary tree.
 

Example 1:


Input: root = [1,2,5,3,4,null,6]
Output: [1,null,2,null,3,null,4,null,5,null,6]
Example 2:

Input: root = []
Output: []
Example 3:

Input: root = [0]
Output: [0]
 

Constraints:

The number of nodes in the tree is in the range [0, 2000].
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
    func flatten(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        helper(node: root!)
    }
    
    func helper(node: TreeNode) -> TreeNode? {
        var savedRight = node.right
        
        if node.left != nil {
            node.right = node.left
        } else {
            savedRight = nil   
        }
        
        node.left = nil
        if node.right != nil {
            let rightMostNode = helper(node: node.right!)
            
            if savedRight != nil {
                let newRightMostNode = helper(node: savedRight!)
                rightMostNode?.right = savedRight
                return newRightMostNode
            } else {
                return rightMostNode
            }
        } else {
            return node
        }
        return nil
    }
}