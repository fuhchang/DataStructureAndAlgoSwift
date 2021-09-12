/*
You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.

 

Example 1:

Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6
Example 2:

Input: lists = []
Output: []
Example 3:

Input: lists = [[]]
Output: []
 

Constraints:

k == lists.length
0 <= k <= 10^4
0 <= lists[i].length <= 500
-10^4 <= lists[i][j] <= 10^4
lists[i] is sorted in ascending order.
The sum of lists[i].length won't exceed 10^4.
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var input = lists
        if input.count == 0 {
            return nil
        }
        if input.count == 1 {
            return input[0]
        }
        return  partition(lists, 0, input.count - 1)
    }

    func partition(_ list:[ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        if start == end {
            return list[start]
        }
        
        if start < end {
            let mid = (start + end)/2
            let list1 = partition(list, start, mid)
            let list2 = partition(list, mid + 1, end)
            return mergeList(list1, list2)
        }
        return nil
    }
    
    func mergeList(_ list1: ListNode?,_ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        
        var result: ListNode?
        
        if list1!.val <= list2!.val {
            result = list1
            result!.next = mergeList(list1!.next, list2)
        }  else {
            result = list2
            result!.next = mergeList(list1, list2!.next)
        }
        return result
    }
}