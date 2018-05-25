//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by dexunzhu on 2018-05-24.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       
        let tabBarController = UITabBarController()
        
        let vancouver = City("Sunny")
        let tokyo = City("Cloudy")
        let beijing = City("Rainy")
        let newYork = City("Foggy")
        let london = City("Windy")
        
        let vanVC = CityViewController()
        vanVC.title = "Vancouver"
        
        
        let tVC = CityViewController()
        tVC.title = "Tokyo"
        
        let bjVC = CityViewController()
        bjVC.title = "Beijing"
        
        let nyVC = CityViewController()
        nyVC.title = "NewYork"
        
        let lVC = CityViewController()
        lVC.title = "London"
        
        vanVC.tabBarItem = UITabBarItem(title: vancouver.weatherInform, image: UIImage(named: "clear-day"), tag: 0)
        tVC.tabBarItem = UITabBarItem(title: tokyo.weatherInform, image: nil, tag: 1)
        bjVC.tabBarItem = UITabBarItem(title: beijing.weatherInform, image: nil, tag: 2)
        nyVC.tabBarItem = UITabBarItem(title: newYork.weatherInform, image: nil, tag: 3)
        lVC.tabBarItem = UITabBarItem(title: london.weatherInform, image: nil, tag: 4)
        let controller = [vanVC, tVC, bjVC, nyVC, lVC]
        tabBarController.viewControllers = controller.map{UINavigationController(rootViewController: $0)}
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

 


}

