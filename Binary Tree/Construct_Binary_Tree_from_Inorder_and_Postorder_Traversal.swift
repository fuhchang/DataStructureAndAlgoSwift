/*
Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

 

Example 1:


Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
Output: [3,9,20,null,null,15,7]
Example 2:

Input: inorder = [-1], postorder = [-1]
Output: [-1]
 

Constraints:

1 <= inorder.length <= 3000
postorder.length == inorder.length
-3000 <= inorder[i], postorder[i] <= 3000
inorder and postorder consist of unique values.
Each value of postorder also appears in inorder.
inorder is guaranteed to be the inorder traversal of the tree.
postorder is guaranteed to be the postorder traversal of the tree.
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return helper(0, inorder.count - 1, 0, postorder.count - 1,inorder, postorder)
    }
    
    func helper(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int, _ inOrder: [Int], _ postOrder: [Int]) -> TreeNode? {
        if postStart > postEnd {
            return nil
        }
        let root = TreeNode(postOrder[postEnd])
        var inIndex = 0
        
        for i in  inStart...inEnd {
            if inOrder[i] == root.val {
                inIndex = i
                break
            }
        }
        root.left = helper(inStart,inIndex - 1, postStart,postStart + inIndex - inStart - 1, inOrder, postOrder)
        root.right = helper(inIndex + 1, inEnd, postEnd - inEnd + inIndex, postEnd - 1, inOrder, postOrder)
        return root
    }
}