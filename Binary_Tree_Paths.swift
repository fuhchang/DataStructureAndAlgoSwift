/*
Given the root of a binary tree, return all root-to-leaf paths in any order.

A leaf is a node with no children.

 

Example 1:


Input: root = [1,2,3,null,5]
Output: ["1->2->5","1->3"]
Example 2:

Input: root = [1]
Output: ["1"]
 

Constraints:

The number of nodes in the tree is in the range [1, 100].
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        
        var path: [String] = []
        var result: [String] = []
        dfs(root, path, &result)
        return result
    }
    
    func dfs(_ node: TreeNode?, _ path: [String], _ arr: inout [String]) {
        guard let node = node else {
            return 
        }
        var path = path 
        path.append("\(node.val)")
        if node.left == nil && node.right == nil {
           arr.append(path.joined(separator: "->"))
        }
        dfs(node.left, path, &arr)
        dfs(node.right, path, &arr)
    }
}