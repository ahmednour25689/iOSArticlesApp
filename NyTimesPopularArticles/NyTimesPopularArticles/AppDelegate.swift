//
//  AppDelegate.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        showInitialView()
        return true
    }
   func applicationWillResignActive(_: UIApplication) {}
    func applicationDidEnterBackground(_: UIApplication) {}
    func applicationWillEnterForeground(_: UIApplication) {}
    func applicationDidBecomeActive(_: UIApplication) {}
    func applicationWillTerminate(_: UIApplication) {}
}
extension AppDelegate {
    private func showInitialView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MostPopularArticlesCoordinator.setupModule()
        window?.makeKeyAndVisible()
    }
}

