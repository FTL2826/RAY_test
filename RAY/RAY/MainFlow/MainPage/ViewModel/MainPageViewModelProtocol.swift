//
//  MainPageViewModelProtocol.swift
//  RAY
//
//  Created by Alex Kharin on 5/30/23.
//

import Foundation

protocol MainPageViewModelProtocol {
    
    var pictureData: Dynamic<Data> { get }
    var networkError: Dynamic<Error> { get }
    
    func submitPressed(_ text: String) -> Result<URL, MainPageViewModel.Errors>
    func dowloadPicture(from url: URL, with text: String)
    func addFavorite() throws
}
