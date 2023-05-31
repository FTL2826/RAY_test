//
//  FileService.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

class FileSevice {
    
    let fm = FileManager.default
    
    init () {}
    
    func getPathToCacheDirectory() -> URL {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let cacheDirectoryPath = urls[0]
        return cacheDirectoryPath
    }
    
    func savePicToCache(_ data: Data) {
        var url = getPathToCacheDirectory()
        print(url)
        do {
            try data.write(to: url, options: .atomic)
        } catch let error {
            print(error, error.localizedDescription)
        }
    }
}
