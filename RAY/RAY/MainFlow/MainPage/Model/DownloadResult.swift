//
//  DownloadResult.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

struct DownloadResult {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}
