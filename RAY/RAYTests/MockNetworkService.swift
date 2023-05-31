//
//  MockNetworkService.swift
//  RAYTests
//
//  Created by Alex Kharin on 6/1/23.
//

import Foundation
@testable import RAY

class MockNetworkService: NetworkServiseProtocol {
    
    class Task: URLSessionDataTaskProtocol {
        func resume() {
            print("task resumed")
        }
    }
    
    var result: Result<Data, Error>?
    
    func createTask(with url: URL, then callback: RAY.NetworkCallback) -> URLSessionDataTaskProtocol {
        callback!(result!)
        let task = Task()
        return task
    }
}
