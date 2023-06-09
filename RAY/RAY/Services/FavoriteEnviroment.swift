//
//  FavoriteEnviroment.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

protocol FavoriteEnviromentProtocol {
    
    func isQueryFavorite(_ text: String) -> Bool
    func append(favorite: Favorite)
    func element(for index: Int) -> Favorite
    func delete(for index: Int)
    func size() -> Int
    func saveDeqToJSON()
    func loadDeqFromJSON()
}

final class FavoriteEnviroment: FavoriteEnviromentProtocol {
    
    static let instance: FavoriteEnviroment = FavoriteEnviroment()
    
    var fileService: FileServiceProtocol
    
    private var favorites: Deque<Favorite> = .init()
    private var favoritesSet: Set<String> = .init()
    private var limit = 5
    private let jsonName = "Favorites.json"
    
    private init() {
        self.fileService = FileSevice()
    }
    
    func isQueryFavorite(_ text: String) -> Bool{
        favoritesSet.contains(text)
    }
    
    func append(favorite: Favorite) {
        if !favoritesSet.contains(favorite.query) {
            favoritesSet.insert(favorite.query)
            favorites.enqueueRear(favorite)
            while favorites.size > 5 {
                favorites.dequeueFront()
            }
        }
    }
    
    func element(for index: Int) -> Favorite {
        if let favorite = favorites.element(for: index) {
            return favorite
        } else {
            fatalError("Corrupt data")
        }
    }
    
    func delete(for index: Int) {
        guard let item = favorites.deleteElement(for: index) else { return }
        favoritesSet.remove(item.query)
    }
    
    func size() -> Int {
        favorites.size
    }
    
    func saveDeqToJSON() {
        var dataToSave: [Favorite] = []
        while !favorites.isEmpty {
            guard let item = favorites.dequeueFront() else { return }
            dataToSave.append(item)
        }
        
        var url = fileService.getPathToCacheDirectory()
        url.appendPathComponent(jsonName)
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(dataToSave)
            try data.write(to: url)
        } catch let error {
            print("Log error in encoding & saving data to save: \(error)")
        }
    }
    
    func loadDeqFromJSON() {
        var containerForLoading: [Favorite] = []
        
        var url = fileService.getPathToCacheDirectory()
        url.appendPathComponent(jsonName)
        
        let decoder = JSONDecoder()
        do {
            containerForLoading = try decoder.decode([Favorite].self, from: Data(contentsOf: url))
            
            for item in containerForLoading {
                favorites.enqueueRear(item)
                favoritesSet.insert(item.query)
            }
        } catch let error {
            print("Log error in loading & decoding data from JSON: \(error)")
        }
    }
    
}
