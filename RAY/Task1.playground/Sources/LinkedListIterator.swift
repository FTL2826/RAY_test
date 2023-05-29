//
//  LinkedListIterator.swift
//  
//
//  Created by Александр Харин on /304/23.
//

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
