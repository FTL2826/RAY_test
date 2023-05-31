//
//  Deque + LL.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

final public class LinkedListNode<T> {
    public var value: T
    var next: LinkedListNode?
    var previous: LinkedListNode?
    
    public init(_ value: T, _ next: LinkedListNode? = nil, _ previous: LinkedListNode? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}

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

final public class LinkedListIterator<T>: IteratorProtocol {
    typealias Node = LinkedListNode<T>
    
    var current: Node?
    
    init(start: Node?) {
        current = start
    }
    
    public func next() -> LinkedListNode<T>? {
        defer { current = current?.next }
        return current
    }
    
}

final public class Deque<T> {
    private var list: LinkedList<T>
    
    public init() {
        self.list = LinkedList<T>()
    }
    
    public var size: Int {
        list.count
    }
    
    public var isEmpty: Bool {
        size == 0
    }
    
    public func enqueueFront(_ value: T) {
        list.insertNode(atIndex: 0, value)
    }
    
    public func enqueueRear(_ value: T) {
        list.insertNode(atIndex: list.count, value)
    }
    
    public func dequeueFront() -> T? {
        list.removeNode(atIndex: 0)?.value
    }
    
    public func dequeueRear() -> T? {
        list.removeNode(atIndex: size - 1)?.value
    }
    
    public func peekFront() -> T? {
        list.node(atIndex: 0)?.value
    }
    
    public func peekRear() -> T? {
        list.node(atIndex: size - 1)?.value
    }
    
    public func erase() {
        while !isEmpty {
            list.removeNode(atIndex: size - 1)
            list.removeNode(atIndex: 0)
        }
    }
    
    public func element(for index: Int) -> T? {
        list.node(atIndex: index)?.value
    }
    
    public func deleteElement(for index: Int) -> T? {
        list.removeNode(atIndex: index)?.value
    }
    
}
