/*
Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

 

Example 1:


Input: head = [1,2,3,4,5], left = 2, right = 4
Output: [1,4,3,2,5]
Example 2:

Input: head = [5], left = 1, right = 1
Output: [5]
 

Constraints:

The number of nodes in the list is n.
1 <= n <= 500
-500 <= Node.val <= 500
1 <= left <= right <= n
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
    var temp: ListNode?
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
       if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        temp = dummy.next
        var pre: ListNode? = dummy
        for _ in 0..<(left - 1) {
            pre = pre?.next
        }
        let start: ListNode? = pre?.next
        var end: ListNode? = start?.next
        for i in 0..<(right - left) {
            start?.next = end?.next
            end?.next = pre?.next
            pre?.next = end
            end = start?.next
        }
        
        return dummy.next
    }
}