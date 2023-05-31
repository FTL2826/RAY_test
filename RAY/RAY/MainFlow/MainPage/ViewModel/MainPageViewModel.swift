//
//  MainPageViewModel.swift
//  RAY
//
//  Created by Alex Kharin on 5/30/23.
//

import Foundation

class MainPageViewModel: MainPageViewModelProtocol {
    
    let networkService: NetworkServise
    let fileService: FileSevice
    var data: Data? {
        didSet {
            guard let pictureData = data else { return }
            fileService.savePicToCache(pictureData)
        }
    }
    enum errors: Error {
        case invalidURL
    }
    var queries: [String: URL] = .init()
    
    init(_ networkService: NetworkServise, _ fileService: FileSevice) {
        self.networkService = networkService
        self.fileService = fileService
    }
    
    func submitPressed(_ text: String) -> Result<URL, errors> {
        guard let url = createURL(text) else { return .failure(.invalidURL) }
        return .success(url)
    }
    
    func dowloadPicture(from url: URL) {
        networkService.createTask(with: url) { [weak self] result in
            guard result.error == nil  else { return }
            guard
                let picData = result.data
            else { return }
            self?.data = picData
        }
    }
    
    
    private func createURL(_ text: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dummyimage.com"
        components.path = "/350x350"
        
        components.queryItems = [URLQueryItem(name: "text", value: text)]
        
        return components.url
    }
    
}
