//
//  FileService.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

class FileSevice {
    
    let fm = FileManager.default
    
    private enum fmErrors: Error {
        case invalidURL
    }
    
    init () {}
    
    func getPathToCacheDirectory() -> URL {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let cacheDirectoryPath = urls[0]
        let folderUrl = cacheDirectoryPath.appendingPathComponent("Pictures", isDirectory: true)
        try? fm.createDirectory(at: folderUrl, withIntermediateDirectories: false)
        
        return cacheDirectoryPath
    }
    
    func savePicToCache(_ data: Data) {
        var url = getPathToCacheDirectory()
        url = url.appendingPathComponent("queryPic", isDirectory: false)
//        print(url)
        do {
            try data.write(to: url, options: .atomic)
        } catch let error {
            print(error, error.localizedDescription)
        }
    }
    
    func saveFavoritePic(_ data: Data) -> Result<URL, Error> {
        var path = getPathToCacheDirectory().absoluteString
        path.append(contentsOf: "Pictures/\(UUID().uuidString)")
//        print(path)
        
        guard let url = URL(string: path) else { return .failure(fmErrors.invalidURL) }
        
        do {
            try data.write(to: url, options: .atomic)
        } catch let error {
            return .failure(error)
        }
        return .success(url)
    }
    
    func deletePic(with url: URL) {
        try? fm.removeItem(at: url)
    }
    
}
