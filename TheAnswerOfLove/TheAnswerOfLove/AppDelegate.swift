//
//  AppDelegate.swift
//  LoveTest
//
//  Created by chang sic jung on 26/06/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let naviVC = UINavigationController(rootViewController: FirstViewController())
        naviVC.navigationBar.isHidden = true
        window?.rootViewController = naviVC
        
        Thread.sleep(forTimeInterval: 2)
        
        return true
    }
}

