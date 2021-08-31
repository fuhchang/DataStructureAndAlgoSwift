import Foundation
import Glibc

// mutliple linked list node
class Node {
    let value: Int
    var linkedNode: [Node]?
    init(value: Int?) {
        self.value = value ?? 0
    }
}


let root = Node(value: 10)
let nodeFive = Node(value: 5)
let nodeSix = Node(value: 6)
let nodeThree = Node(value: 3)
let nodeFour = Node(value: 4)
let nodeEight = Node(value: 8)
let nodeSeven = Node(value: 7)
let nodeNine = Node(value: 9)
nodeFive.linkedNode = [nodeEight, nodeFour]
nodeFour.linkedNode = [nodeEight,nodeSeven]
nodeSeven.linkedNode = [nodeSix]
nodeSix.linkedNode = [nodeNine]
nodeNine.linkedNode = [root]
root.linkedNode = [nodeFive, nodeSix, nodeThree]

func bfsPrint(node: Node?) {
 var nodeValueList = [Int]()
    if let node = node {
        var queue:[Node] = [Node]()
        queue.append(node)
        while !queue.isEmpty {
            let first = queue.removeFirst()
            if !nodeValueList.contains(first.value) {
                nodeValueList.append(first.value)
                if let list = first.linkedNode {
                    for currentNode in list {
                        queue.append(currentNode)
                    }
               }
           }
        }
    }
    print("breath first search \(nodeValueList)")
}

var nodeDFSStack = [Int]()
func dfsPrint(node: Node?) {
    if let node = node {
        if !nodeDFSStack.contains(node.value) {
            nodeDFSStack.append(node.value)
            if let list = node.linkedNode {
                for currentNode in list {
                   dfsPrint(node: currentNode)
                }
            }
        }
    }
}


bfsPrint(node: root)

dfsPrint(node: root)
print("depth first search \(nodeDFSStack)")


//single linked list node
import Foundation
import Glibc

class linkedListNode {
     var value: Int
     var next: linkedListNode?
     init(value: Int) {
        self.value = value
     }
 }


func reverse(root: linkedListNode?) -> linkedListNode?  {
    var prev: linkedListNode? = nil
    var curr: linkedListNode? = root
    var next: linkedListNode? = nil

    while curr != nil {
        next = curr?.next
        curr?.next = prev
        prev = curr
        curr = next
    }
    return prev
}

func reverseRecursion(root: linkedListNode?) -> linkedListNode? {
    guard let head = root else {
        return root
    }
    if head.next == nil {
        return head
    }
    let reversehead = reverseRecursion(root: head.next)
    head.next?.next = head
    head.next = nil

    return reversehead
}



func printLinkedList(root: linkedListNode?) {
    var curr = root
    while curr != nil {
        print(curr?.value ?? 0)
        if let next = curr?.next {
            curr = next
        } else {
            curr = nil
        }
    }
}
 let node1 = linkedListNode(value: 1)
 let node2 = linkedListNode(value: 2)
 let node3 = linkedListNode(value: 3)
 let node4 = linkedListNode(value: 4)
 node1.next = node2
 node2.next = node3
 node3.next = node4
let node = reverseRecursion(root: node1)

//  let node = reverse(root: node1)
 printLinkedList(root: node)
