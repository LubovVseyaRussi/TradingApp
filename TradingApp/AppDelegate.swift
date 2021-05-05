//
//  AppDelegate.swift
//  TradingApp
//
//  Created by Lubov on 22.04.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let symbols = SymbolsRouter.createSymbolsModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = symbols
        window?.rootViewController = UINavigationController(rootViewController: symbols)
        window?.makeKeyAndVisible()
        
        return true
    }
}

