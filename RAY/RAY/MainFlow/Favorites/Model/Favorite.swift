//
//  Favorite.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import Foundation

struct Favorite: Hashable, Codable {
    let query: String
    let pictureData: Data
}
