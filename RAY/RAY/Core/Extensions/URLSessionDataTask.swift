//
//  URLSessionDataTask.swift
//  RAY
//
//  Created by Alex Kharin on 6/1/23.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
