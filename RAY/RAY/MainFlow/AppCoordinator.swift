//
//  AppCoordinator.swift
//  RAY
//
//  Created by Александр Харин on /305/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    
    init() {
        self.rootViewController = UITabBarController()
    }
    
    func start() {
        let vcList: [UIViewController] = [VCFactory.createMainPage(), VCFactory.createFavouritesVC()]
        rootViewController.setViewControllers(vcList, animated: false)
    }
}
