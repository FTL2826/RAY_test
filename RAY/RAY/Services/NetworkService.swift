//
//  NetworkService.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

typealias NetworkCallback = ((Result<Data, Error>) -> Void)?

protocol NetworkServiseProtocol {
    func createTask(with url: URL, then callback: NetworkCallback) -> URLSessionDataTaskProtocol
}

final class NetworkServise: NetworkServiseProtocol {
    
    static let instance = NetworkServise()
    private var session: URLSession
    
    private init() {
        let configure = URLSessionConfiguration.ephemeral
        if #available(iOS 13.0, *) {
            configure.urlCache = URLCache(memoryCapacity: 1024 * 1024 * 10, diskCapacity: 0)
        } else {
            configure.urlCache = .init(memoryCapacity: 1024 * 1024 * 10, diskCapacity: 0, diskPath: nil)
        }
        configure.httpMaximumConnectionsPerHost = 1
        configure.waitsForConnectivity = false
        configure.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: configure)
    }
    
    func createTask(with url: URL, then callback: NetworkCallback) -> URLSessionDataTaskProtocol {
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Image download error: ", error)
                callback?(.failure(error))
            } else {
                
            }
            if let data = data {
                callback?(.success(data))
            }
        }
        return task
    }
    
}
