//
//  MainPageViewModel.swift
//  RAY
//
//  Created by Alex Kharin on 5/30/23.
//

import Foundation

final class MainPageViewModel: MainPageViewModelProtocol {
    
    let networkService: NetworkServiseProtocol
    let fileService: FileSevice
    let favoriteEnviroment: FavoriteEnviroment
    
    var pictureData: Dynamic<Data> = Dynamic(Data())
    var networkError: Dynamic<Error> = Dynamic(Errors.invalidPicture)
    
    private var lastQuery: String = ""
    enum Errors: Error {
        case invalidURL
        case invalidPicture
    }
    
    init(_ networkService: NetworkServiseProtocol, _ fileService: FileSevice, _ favoriteEnviroment: FavoriteEnviroment) {
        self.networkService = networkService
        self.fileService = fileService
        self.favoriteEnviroment = favoriteEnviroment
    }
    
    func submitPressed(_ text: String) -> Result<URL, Errors> {
        guard let url = createURL(text) else { return .failure(.invalidURL) }
        return .success(url)
    }
    
    func dowloadPicture(from url: URL, with text: String) {
        let task = networkService.createTask(with: url) {[weak self] result in
            switch result {
            case .success(let data):
                self?.pictureData.value = data
                self?.fileService.savePicToCache(data)
            case .failure(let error):
                self?.networkError.value = error
            }
        }
        task.resume()
    }
    
    func addFavorite() {
        let savedUrl = fileService.saveFavoritePic(pictureData.value)
        let favorite = Favorite(query: lastQuery, urlToPic: savedUrl)
        favoriteEnviroment.append(favorite: favorite)
        
    }
    
    
    private func createURL(_ text: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dummyimage.com"
        components.path = "/350x350"
        
        components.queryItems = [URLQueryItem(name: "text", value: text)]
        lastQuery = text
        
        return components.url
    }
    
}
