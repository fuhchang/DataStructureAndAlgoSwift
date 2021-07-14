import Foundation
import Glibc
 
struct MinHeap {
    var items:[Int] = []
    //Get Index
    func getLeftChildIndex(_ parentIndex: Int) -> Int? {
        return 2 * parentIndex + 1
    }
    func getRightChildIndex(_ parentIndex: Int) -> Int? {
        return 2 * parentIndex + 2
    }
    func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    func getItemIndex(_ item: Int) -> Int {
        for i in 0..<items.count {
            if items[i] == item {
                return i
            }
        }
        return 0
    }
    //Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) ?? 0 < items.count
    }
    
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) ?? 0 < items.count
    }
    
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // Return Item from Heap
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index) ?? 0]
    }
    
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index) ?? 0]
    }
    
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }

    //see top item
    public func peek() -> Int {
        if items.count != 0 {
            return items.first!
        } else {
            fatalError()
        }
    }
    
    //remove item
    mutating public func poll() -> Int {
        if items.count != 0 {
            let item = items[0]
            items[0] = items[items.count - 1]
            items.removeLast()
            print(items)
            heapifyDown(items[0])
            return item
        } else {
            fatalError()
        }
    }
    
    mutating public func add(_ item: Int) {
        items.append(item)
        heapifyUp(item)
    }
    
    mutating func heapifyDown(_ item: Int) {
       let itemIndex = getItemIndex(item)
       if items.count > 0 {
            if let lci = getLeftChildIndex(itemIndex), lci < items.count - 1, item > items[lci] {
                items.swapAt(lci, itemIndex)
                heapifyDown(item)
            } 
            else if let rci = getRightChildIndex(itemIndex), rci < items.count - 1,item > items[rci] {
                items.swapAt(rci, itemIndex)
                heapifyDown(item)
            }
        }
        print(items)
    }
    
    mutating func heapifyUp(_ item: Int) {
        let itemIndex = getItemIndex(item)
        if items.count > 0 {
            if item < items[getParentIndex(itemIndex)] {
                items.swapAt(getParentIndex(itemIndex), itemIndex)
                heapifyUp(item)
            }   
        }
        print(items)
    }
}

var heap = MinHeap()
heap.add(4)
heap.add(2)
heap.add(1)
heap.add(5)
heap.add(0)
print("parent of 5 is \(heap.items[heap.getParentIndex(heap.getItemIndex(5))])")
print(heap.poll())