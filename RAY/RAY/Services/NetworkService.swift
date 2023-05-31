//
//  NetworkService.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

final class NetworkServise {
    
    static let instance = NetworkServise()
    
    private var session: URLSession
    
    private init() {
        let configure = URLSessionConfiguration.ephemeral
        configure.urlCache = URLCache(memoryCapacity: 1024 * 1024 * 10, diskCapacity: 0)
        configure.httpMaximumConnectionsPerHost = 1
        configure.waitsForConnectivity = false
        configure.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: configure)
    }
    
    func createTask(with url: URL, completion: @escaping (DownloadResult) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: url) { data, response, error in
            let result = DownloadResult(data: data, response: response, error: error)
            completion(result)
        }
        task.resume()
        return task
    }
    
}
