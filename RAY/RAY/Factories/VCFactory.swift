//
//  VCFactory.swift
//  RAY
//
//  Created by Александр Харин on /305/23.
//

import UIKit

final class VCFactory {
    
    static func createMainPage() -> UIViewController {
        let vm = MainPageViewModel(NetworkServise.instance, FileSevice())
        let vc = MainPageVC(vm: vm)
        vc.tabBarItem = UITabBarItem(
            title: "Generate picture",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        
        return vc
    }
    
    static func createFavouritesVC() -> UIViewController {
        let vc = FavoritesVC()
        vc.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill"))
        
        return vc
    }
    
}
