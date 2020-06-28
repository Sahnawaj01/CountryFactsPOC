//
//  AppDelegate.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 28/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var navController: UINavigationController = {
        let viewController = HomeViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.barTintColor = UIColor.navBarColor()
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        return navigationController
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadRootViewController()
        return true
    }

    // Initalize root view controller
    private func loadRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}
