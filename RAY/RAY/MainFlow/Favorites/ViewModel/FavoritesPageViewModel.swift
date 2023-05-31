//
//  FavoritesPageViewModel.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

final class FavoritesPageViewModel: FavoritesPageViewModelProtocol {
    let favoriteEnviroment: FavoriteEnviromentProtocol
    
    init(
        _ favoriteEnviroment: FavoriteEnviromentProtocol
    ) {
        self.favoriteEnviroment = favoriteEnviroment
    }
    
    func itemsInTable() -> Int {
        return favoriteEnviroment.size()
    }
    
    func favorite(for index: Int) -> Favorite {
        favoriteEnviroment.element(for: index)
    }
    
    func delete(index: Int){
        favoriteEnviroment.delete(for: index)
    }
}
