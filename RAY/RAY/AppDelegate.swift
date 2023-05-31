//
//  AppDelegate.swift
//  RAY
//
//  Created by Александр Харин on /295/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        coordinator = AppCoordinator()
        coordinator?.start()
        window?.rootViewController = coordinator?.rootViewController
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        FavoriteEnviroment.instance.loadDeqFromJSON()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        FavoriteEnviroment.instance.saveDeqToJSON()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        FavoriteEnviroment.instance.saveDeqToJSON()
    }


}

