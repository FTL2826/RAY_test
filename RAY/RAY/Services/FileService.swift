//
//  FileService.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

protocol FileServiceProtocol {
    func getPathToCacheDirectory() -> URL
    func savePicToCache(_ data: Data)
    func deletePic(with url: URL)
}

class FileSevice: FileServiceProtocol {
    
    let fm = FileManager.default
    
    private enum fmErrors: Error {
        case invalidURL
    }
    
    init () {}
    
    func getPathToCacheDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let cacheDirectoryPath = urls[0]
        let folderUrl = cacheDirectoryPath.appendingPathComponent("Pictures", isDirectory: true)
        try? fm.createDirectory(at: folderUrl, withIntermediateDirectories: false)
        
        return cacheDirectoryPath
    }
    
    func savePicToCache(_ data: Data) {
        var url = getPathToCacheDirectory()
        url = url.appendingPathComponent("queryPic", isDirectory: false)
        do {
            try data.write(to: url, options: .atomic)
        } catch let error {
            print(error, error.localizedDescription)
        }
    }
    
    func deletePic(with url: URL) {
        try? fm.removeItem(at: url)
    }
    
}
