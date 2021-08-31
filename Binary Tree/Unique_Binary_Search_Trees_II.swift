/*
Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

 

Example 1:


Input: n = 3
Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
Example 2:

Input: n = 1
Output: [[1]]
 

Constraints:

1 <= n <= 8
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n <= 0 {
            return []
        }
        return helper(1, n) 
    }
    
    func helper(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]
        }
        
        if start == end {
            return [TreeNode(start)]
        }
        var result = [TreeNode?]()
        var leftSubTrees = [TreeNode?]()
        var rightSubtrees = [TreeNode?]()
        for i in start...end {
            leftSubTrees = helper(start, i-1)
            rightSubtrees = helper(i+1, end)
            
            for left in leftSubTrees {
                for right in rightSubtrees {
                    let node = TreeNode(i)
                    node.left = left
                    node.right = right
                    result.append(node)
                }
            }
        }
        return result
    }
}