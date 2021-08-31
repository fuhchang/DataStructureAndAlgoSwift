/*
Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

 

Example 1:


Input: root = [3,9,20,null,null,15,7]
Output: [[3],[20,9],[15,7]]
Example 2:

Input: root = [1]
Output: [[1]]
Example 3:

Input: root = []
Output: []
 

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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let head = root else { return [] }
        var result: [[Int]] = []
        var level: [TreeNode] = [head]
        var levelValues: [Int] = []
        var isZigZag: Bool = false
        while level.count > 0 {
            var nextLevel: [TreeNode] = []
            var levelValues: [Int] = []
            while level.count > 0 {
                var node = level.removeFirst()
                if isZigZag {
                    levelValues.insert(node.val, at: 0)
                } else {
                    levelValues.append(node.val)
                }
                if let left = node.left { nextLevel.append(left)}
                if let right = node.right { nextLevel.append(right) }
            }
            result.append(levelValues)
            level = nextLevel
            isZigZag = isZigZag ? false : true
        }
        return result
    }
}