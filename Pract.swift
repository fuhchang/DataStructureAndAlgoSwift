import Foundation
import Glibc
 
/*
     10
    / \
   5  14
  /   / \
 1   11 20
*/

class Node {
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int?) {
        self.value = value ?? 0
    }
}

// left branch
let leftNodeFive = Node(value: 5)
let leftNodeOne = Node(value: 1)
let rightNodeTwo = Node(value: 2)
leftNodeFive.leftChild = leftNodeOne
leftNodeFive.rightChild = rightNodeTwo

//right branch
let rightNodeFourteen = Node(value: 14)
let leftNodeEleven = Node(value: 11)
let rightNodeTwenty = Node(value: 20)
rightNodeFourteen.leftChild = leftNodeEleven
rightNodeFourteen.rightChild = rightNodeTwenty
//root
let root = Node(value: 10)
root.leftChild = leftNodeFive
root.rightChild = rightNodeFourteen  

func search(node: Node?, searchValue: Int) -> Bool {
    if node == nil {
        return false
    }
    if node?.value == searchValue {
        return true
    } else if searchValue < node?.value ?? 0 {
        return search(node: node?.leftChild, searchValue: searchValue)
    } else {
        return search(node: node?.rightChild, searchValue: searchValue)
        // return search(node: node?.leftChild, searchValue: searchValue) || search(node: node?.rightChild, searchValue: searchValue)
    }
}

func bfsPrint(node: Node?) {
    var nodeValueList = [Int]()
    if let node = node {
        var queue:[Node] = [Node]()
        queue.append(node)
        while !queue.isEmpty {
            let first = queue.removeFirst()
            nodeValueList.append(first.value)
            if let left = first.leftChild {
                queue.append(left)
            }
            if let right = first.rightChild {
                queue.append(right)
            }
        }
    }
    print(nodeValueList)
}

func reverseBfsPrint(node: Node?) {
    var nodeValueList = [Int]()
    if let node = node {
        var queue:[Node] = [Node]()
        queue.append(node)
        while !queue.isEmpty {
            let first = queue.removeFirst()
            nodeValueList.append(first.value)
            if let right = first.rightChild {
                queue.append(right)
            }
            if let left = first.leftChild {
                queue.append(left)
            }
        }
    }
    print(nodeValueList)
}
var nodeDFSList = [Int]()
func dfsPrint(node: Node?) {
    if node == nil {
        return 
    } else {
        nodeDFSList.append(node?.value ?? 0)
        dfsPrint(node: node?.leftChild)
        dfsPrint(node: node?.rightChild)
    }
}
let result = search(node: root, searchValue: 14)
print("Is node found? \(result)")

dfsPrint(node: root)
print(nodeDFSList)
bfsPrint(node: root)
reverseBfsPrint(node: root)