//
//  MainPageViewModelProtocol.swift
//  RAY
//
//  Created by Alex Kharin on 5/30/23.
//

import Foundation

protocol MainPageViewModelProtocol {
    func submitPressed(_ text: String) -> Result<URL, MainPageViewModel.errors>
    
    func dowloadPicture(from url: URL)
}
