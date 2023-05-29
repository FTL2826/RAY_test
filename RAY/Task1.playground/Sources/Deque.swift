//
//  Deque.swift
//  
//
//  Created by Александр Харин on /35/23.
//
//import LinkedList

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
    
}
