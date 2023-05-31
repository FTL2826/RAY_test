//
//  VCFactory.swift
//  RAY
//
//  Created by Александр Харин on /305/23.
//

import UIKit

final class VCFactory {
    
    func createMainPage() -> UIViewController {
        let vm = MainPageViewModel(
            NetworkServise.instance,
            FileSevice(),
            FavoriteEnviroment.instance)
        let vc = MainPageVC(vm: vm)
        vc.tabBarItem = UITabBarItem(
            title: "Generate picture",
            image: UIImage(named: "house"),
            selectedImage: UIImage(named: "house.fill"))
        
        return vc
    }
    
    func createFavouritesVC() -> UIViewController {
        let vm = FavoritesPageViewModel(FavoriteEnviroment.instance)
        let vc = FavoritesVC(vm: vm)
        vc.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(named: "star"),
            selectedImage: UIImage(named: "star.fill"))
        
        return vc
    }
    
}
