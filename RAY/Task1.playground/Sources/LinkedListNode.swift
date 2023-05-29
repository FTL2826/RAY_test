//
//  LinkedListNode.swift
//  
//
//  Created by Александр Харин on /304/23.
//

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
