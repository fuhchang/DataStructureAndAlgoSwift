/*
Given the head of a linked list, rotate the list to the right by k places.

 

Example 1:


Input: head = [1,2,3,4,5], k = 2
Output: [4,5,1,2,3]
Example 2:


Input: head = [0,1,2], k = 4
Output: [2,0,1]
 

Constraints:

The number of nodes in the list is in the range [0, 500].
-100 <= Node.val <= 100
0 <= k <= 2 * 109
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
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head?.next != nil else { return head }
        var firstNode: ListNode? = head
        var lastNode: ListNode? = head
        var pos = 0
        while firstNode != nil {
            pos += 1
            firstNode = firstNode?.next
        }
        firstNode = head
        for _ in 0..<(k % pos) {
            firstNode = firstNode?.next
        }
        while firstNode?.next != nil {
            firstNode = firstNode?.next
            lastNode = lastNode?.next
        }
        firstNode?.next = head
        let newHead = lastNode?.next
        lastNode?.next = nil
        return newHead
    }
}