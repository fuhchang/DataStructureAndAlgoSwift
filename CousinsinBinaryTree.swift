/*
Given the root of a binary tree with unique values and the values of two different nodes of the tree x and y, return true if the nodes corresponding to the values x and y in the tree are cousins, or false otherwise.

Two nodes of a binary tree are cousins if they have the same depth with different parents.

Note that in a binary tree, the root node is at the depth 0, and children of each depth k node are at the depth k + 1.

 

Example 1:


Input: root = [1,2,3,4], x = 4, y = 3
Output: false
Example 2:


Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
Output: true
Example 3:


Input: root = [1,2,3,null,4], x = 2, y = 3
Output: false
 

Constraints:

The number of nodes in the tree is in the range [2, 100].
1 <= Node.val <= 100
Each node has a unique value.
x != y
x and y are exist in the tree.
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
    var xDepth: Int?
    var yDepth: Int?
    var targetX: Int = 0
    var targetY: Int = 0
    var parentXVal: Int?
    var parentYVal: Int?
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard root != nil else { return false}
        targetX = x
        targetY = y
        dfs(root, 1)
        if xDepth != yDepth {
            return false
        } else {
            return parentXVal != parentYVal
        }
        return false 
    }
    
    func dfs(_ node: TreeNode?, _ level: Int) {
        guard let node = node else { return }
        if node.left?.val == targetX || node.right?.val == targetX {
            xDepth = level
            parentXVal = node.val
        }
        
        if node.left?.val == targetY || node.right?.val == targetY {
            yDepth = level
            parentYVal = node.val
        }
        dfs(node.left, level + 1)
        dfs(node.right, level + 1)
    }
}