/*
Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

 

Example 1:


Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]
Example 2:

Input: head = [2,1], x = 2
Output: [1,2]
 

Constraints:

The number of nodes in the list is in the range [0, 200].
-100 <= Node.val <= 100
-200 <= x <= 200
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var head = head
        var ans: ListNode? = ListNode(0)
        var left = ans
        var right = ans
        while head != nil {
            if head?.val ?? 0 < x {
                let temp = left?.next
                left?.next = ListNode(head?.val ?? 0)
                left = left?.next
                left?.next = temp
            } else {
                while right?.next != nil { right = right?.next }
                right?.next = ListNode(head?.val ?? 0)
                right = right?.next
            }
            head = head?.next
        }
        return ans?.next
    }
}