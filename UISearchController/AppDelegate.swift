//
//  AppDelegate.swift
//  UISearchController
//
//  Created by StYiWe on 2020/9/16.
//  Copyright © 2020 stYiwe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navC = UINavigationController.init(rootViewController: ViewController.init())
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

