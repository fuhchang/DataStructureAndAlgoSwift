/*
Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

 

Example 1:


Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
Example 2:

Input: preorder = [-1], inorder = [-1]
Output: [-1]
 

Constraints:

1 <= preorder.length <= 3000
inorder.length == preorder.length
-3000 <= preorder[i], inorder[i] <= 3000
preorder and inorder consist of unique values.
Each value of inorder also appears in preorder.
preorder is guaranteed to be the preorder traversal of the tree.
inorder is guaranteed to be the inorder traversal of the tree.
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return helper(0, 0, inorder.count - 1, preorder, inorder)
    }
    
    func helper(_ prevStart: Int, _ inStart: Int, _ inEnd: Int, _ preOrder: [Int], _ inOrder: [Int]) -> TreeNode? {
        if prevStart > preOrder.count - 1 || inStart > inEnd {
            return nil
        }
        let root = TreeNode(preOrder[prevStart])
        var inIndex = 0
        
        for i in inStart...inEnd {
            if inOrder[i] == root.val {
                inIndex = i
                break
            }
        }
        
        root.left = helper(prevStart + 1, inStart, inIndex - 1, preOrder, inOrder)
        root.right = helper(prevStart + inIndex - inStart + 1, inIndex + 1, inEnd, preOrder, inOrder)
        return root
    }
}