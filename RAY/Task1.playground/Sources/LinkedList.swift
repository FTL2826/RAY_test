//
//  LinkedList.swift
//  
//
//  Created by Александр Харин on /304/23.
//

final public class LinkedList<T>: Sequence {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    private var tail: Node?
    
    public init() {}
    
    // O(1)
    public var first: Node? {
        head
    }
    
    // O(1)
    public var last: Node? {
        tail
    }
    public var count: Int = 0
    
    // O(n)
    public var print: String {
        var strOutput = "["
        guard var node = head else { return "[]" }
        while let next = node.next {
            strOutput += "\(node.value), "
            node = next
        }
        strOutput += "\(node.value)"
        return strOutput + "]"
    }
    
    // O(1)
    public func append(_ value: T) {
        count += 1
        let newNode = Node(value)
        if let lastNode = tail {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    // O(index)
    public func node(atIndex index: Int) -> Node? {
        guard index < count && index >= 0 else { return nil }
        var node: LinkedListNode<T>?
        if index == 0 {
            return head
        } else if index == count - 1 {
            return tail
        } else {
            node = head?.next
            var curIndex = 1
            while index > curIndex {
                node = node?.next
                curIndex += 1
            }
        }
        return node
    }
    
    // travers O(n)
    public func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator<T>(start: head)
    }
    
    public func insertNode(atIndex index: Int, _ value: T) -> Bool {
        guard index <= count && index >= 0 else { return false }
        let newNode = LinkedListNode(value)
        if index == 0 {
            let p = head
            newNode.next = p
            p?.previous = newNode
            head = newNode
            if count == 0 {
                tail = head
            }
        } else if index == count {
            tail?.next = newNode
            newNode.previous = tail
            tail = newNode
        } else {
            guard let p = node(atIndex: index) else { return false }
            newNode.previous = p.previous
            newNode.next = p
            p.previous?.next = newNode
            p.previous = newNode
        }
        count += 1
        
        return true
    }
    
    public func removeNode(atIndex index: Int) -> Node? {
        guard index < count && index >= 0 else { return nil }
        let node: Node?
        if index == 0 {
            node = head
            head = head?.next
        } else if index == count - 1 {
            node = tail
            tail = tail?.previous
            tail?.next = nil
        } else {
            node = self.node(atIndex: index)
            let prev = node?.previous
            let next = node?.next
            
            prev?.next = next
            next?.previous = prev
        }
    
        node?.next = nil
        node?.previous = nil
        
        count -= 1
        return node
    }
    
    func reversed() {
        var ptr1 = head
        var ptr2 = ptr1?.next
        
        ptr1?.next = nil
        ptr1?.previous = ptr2
        
        while ptr2 != nil {
            ptr2?.previous = ptr2?.next
            ptr2?.next = ptr1
            ptr1 = ptr2
            ptr2 = ptr2?.previous
        }
        tail = head
        head = ptr1
    }
    
}
