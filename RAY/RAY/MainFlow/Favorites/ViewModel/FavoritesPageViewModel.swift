//
//  FavoritesPageViewModel.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

class FavoritesPageViewModel: FavoritesPageViewModelProtocol {
    let favoriteEnviroment: FavoriteEnviroment
    
    init(
        _ favoriteEnviroment: FavoriteEnviroment
    ) {
        self.favoriteEnviroment = favoriteEnviroment
    }
    
    func itemsInTable() -> Int {
        return favoriteEnviroment.size()
    }
    
    func favorite(for index: Int) -> Favorite {
        favoriteEnviroment.element(for: index)
    }
    
    func delete(index: Int) -> Result<Bool, Error> {
        do {
            try favoriteEnviroment.delete(for: index)
        } catch let error {
            return .failure(error)
        }
        return .success(true)
    }
}
