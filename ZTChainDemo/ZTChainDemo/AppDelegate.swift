//
//  AppDelegate.swift
//  ZTChainDemo
//
//  Created by trojan on 2024/6/4.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
            .zt
            .frame(UIScreen.main.bounds) 
//            ({
//                $0.makeKeyAndVisible()
//            })
            .backgroundColor(.white)
            .rootViewController(UINavigationController(rootViewController: ViewController()))
            .call {
                $0.makeKeyAndVisible()
            }
//            .callAsFunction({
//                $0.makeKeyAndVisible()
//            })
        
//            .subject
//            .zt {
//                $0.makeKeyAndVisible()
//            }
            .build()
        
        return true
    }
}

