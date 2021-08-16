/*
You are given the root of a binary search tree (BST), where exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.

Follow up: A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?

 

Example 1:


Input: root = [1,3,null,null,2]
Output: [3,1,null,null,2]
Explanation: 3 cannot be a left child of 1 because 3 > 1. Swapping 1 and 3 makes the BST valid.
Example 2:


Input: root = [3,1,4,null,null,2]
Output: [2,1,4,null,null,3]
Explanation: 2 cannot be in the right subtree of 3 because 2 < 3. Swapping 2 and 3 makes the BST valid.
 

Constraints:

The number of nodes in the tree is in the range [2, 1000].
-231 <= Node.val <= 231 - 1
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
    var firstElement: TreeNode?  = nil
    var secondElement: TreeNode? = nil
    var prevElement = TreeNode(Int.min)
    func recoverTree(_ root: TreeNode?) {
        inOrdertraverse(root)
        
        let temp = firstElement!.val
        firstElement!.val = secondElement!.val
        secondElement!.val = temp
    }
    
    func inOrdertraverse(_ root: TreeNode?) {
        if root == nil {
            return
        }
        inOrdertraverse(root?.left)
        if firstElement == nil && prevElement.val >= root!.val {
            firstElement = prevElement
        }
        
        if firstElement != nil && prevElement.val >= root!.val {
            secondElement = root
        }
        prevElement = root!
        inOrdertraverse(root?.right)
    }
}