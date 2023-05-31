//
//  MockFavoriteEnviroment.swift
//  RAYTests
//
//  Created by Alex Kharin on 6/1/23.
//

import Foundation
@testable import RAY

final class MockFavoriteEnviroment: FavoriteEnviromentProtocol {
    func isQueryFavorite(_ text: String) -> Bool {
        return false
    }
    
    func append(favorite: RAY.Favorite) {
    
    }
    
    func element(for index: Int) -> RAY.Favorite {
        return Favorite(query: "", pictureData: Data())
    }
    
    func delete(for index: Int) {
        
    }
    
    func size() -> Int {
        return 0
    }
    
    func saveDeqToJSON() {
        
    }
    
    func loadDeqFromJSON() {
        
    }
    
    
}
