import Foundation
import Glibc

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
