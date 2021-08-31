/*
iven the head of a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 

Example 1:


Input: head = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: One possible answer is [0,-3,9,-10,null,5], which represents the shown height balanced BST.
Example 2:

Input: head = []
Output: []
Example 3:

Input: head = [0]
Output: [0]
Example 4:

Input: head = [1,3]
Output: [3,1]
 

Constraints:

The number of nodes in head is in the range [0, 2 * 104].
-105 <= Node.val <= 105
*/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var data = [Int]()
        var cur = head
        while cur != nil { 
            data.append(cur!.val) 
            cur = cur?.next
        }
        
        return helper(data, 0, data.count-1)
    }
    
    func helper(_ data: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        if l > r { return nil }
        
        let mid = (l+r)/2
        let left = helper(data, l, mid-1)
        let right = helper(data, mid+1, r)
        return TreeNode(data[mid], left, right)
    }
}
// class Solution {
//     func sortedListToBST(_ head: ListNode?) -> TreeNode? {
//         guard let root = head else { return nil }
//         return sorted(head, nil)
//     }
    
//     func sorted(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
//         if head === tail {
//             return nil
//         }
        
//         var fast = head
//         var slow = head
        
//         while !(fast === tail) && !(fast?.next === tail) {
//             fast = fast?.next?.next
//             slow = slow?.next
//         }
        
//         let root = TreeNode(slow!.val)
//         root.left = sorted(head, slow)
//         root.right = sorted(slow?.next, tail)
//         return root
//     }
// }