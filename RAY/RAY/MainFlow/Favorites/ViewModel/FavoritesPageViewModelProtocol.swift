//
//  FavoritesPageViewModelProtocol.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

protocol FavoritesPageViewModelProtocol {
    func itemsInTable() -> Int
    func favorite(for index: Int) -> Favorite
    func delete(index: Int) -> Result<Bool, Error>
}
