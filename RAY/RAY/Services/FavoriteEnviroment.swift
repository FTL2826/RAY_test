//
//  FavoriteEnviroment.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

class FavoriteEnviroment {
    
    static let instance: FavoriteEnviroment = FavoriteEnviroment()
    var favorites: Deque<Favorite> = .init()
    private var limit = 5
    
    private init() {}
    
    func append(favorite: Favorite) {
        favorites.enqueueRear(favorite)
        while favorites.size >= 5 {
            favorites.dequeueFront()
        }
    }
    
}
