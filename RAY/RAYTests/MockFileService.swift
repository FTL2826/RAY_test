//
//  MockFileService.swift
//  RAYTests
//
//  Created by Alex Kharin on 6/1/23.
//

import Foundation
@testable import RAY

final class MockFileService: FileServiceProtocol {
    func getPathToCacheDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let cacheDirectoryPath = urls[0]
        return cacheDirectoryPath
    }
    
    func savePicToCache(_ data: Data) {
        
    }
    
    func deletePic(with url: URL) {
    
    }
    
    
}
