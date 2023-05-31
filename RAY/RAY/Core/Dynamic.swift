//
//  Dynamic.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

final class Dynamic<T> {
    
    typealias Listener = (T) -> ()
    
    private var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    
}
