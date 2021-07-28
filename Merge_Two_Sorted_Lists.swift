/*
Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

 

Example 1:


Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]
Example 2:

Input: l1 = [], l2 = []
Output: []
Example 3:

Input: l1 = [], l2 = [0]
Output: [0]
 

Constraints:

The number of nodes in both lists is in the range [0, 50].
-100 <= Node.val <= 100
Both l1 and l2 are sorted in non-decreasing order.
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
       if l1 == nil && l2 == nil {
           return nil
       } else if l1 != nil && l2 == nil {
           return l1
       } else if l1 == nil && l2 != nil {
           return l2
       }
        
        var first: ListNode? = l1!.val < l2!.val ? l1 : l2
        var second: ListNode? =  l1!.val < l2!.val ? l2 : l1
        
        while second != nil {
            while first!.next != nil {
                if second!.val <= first!.next!.val {
                    let temp = first!.next
                    first!.next = second
                    second = temp
                }
                first = first!.next
            }
            if first!.next == nil {
                first!.next = second
                break
            }
        }
        return l1!.val < l2!.val ? l1 : l2
    }
}