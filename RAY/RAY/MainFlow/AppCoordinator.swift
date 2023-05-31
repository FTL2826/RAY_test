//
//  AppCoordinator.swift
//  RAY
//
//  Created by Александр Харин on /305/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    private var factory: VCFactory
    
    init() {
        self.rootViewController = UITabBarController()
        self.factory = .init()
    }
    
    func start() {
        let vcList: [UIViewController] = [factory.createMainPage(), factory.createFavouritesVC()]
        rootViewController.setViewControllers(vcList, animated: false)
    }
}
