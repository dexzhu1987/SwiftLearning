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
    
    let vancouver: City = City("Sunny", UIImage(named: "vancouverdetails")!)
    let tokyo: City = City("Cloudy", UIImage(named: "tokyodetails2")!)
    let beijing: City = City("Rainy", UIImage(named: "beijingdetails")!)
    let newYork: City = City("Foggy", UIImage(named: "newyorkdetails")!)
    let london: City = City("Windy", UIImage(named: "londondetails")!)
    
    let vanVC: CityViewController = CityViewController()
    let tVC: CityViewController = CityViewController()
    let bjVC: CityViewController = CityViewController()
    let nyVC: CityViewController = CityViewController()
    let lVC: CityViewController = CityViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       
        let tabBarController = UITabBarController()
        
    
    

        vanVC.title = "Vancouver"
        vanVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "van")!.imageResize(sizeChange: CGSize(width: vanVC.view.frame.size.width, height: vanVC.view.frame.size.height * 0.9)))
        let pic : UIView = addImagePic("sunny")
        pic.frame = CGRect(x: vanVC.view.bounds.width / 2, y: vanVC.view.bounds.height / 2, width: 100, height: 100)
        vanVC.view.addSubview(pic)
        let button: UIButton = UIButton(frame: CGRect(x: vanVC.view.bounds.width / 2, y: vanVC.view.bounds.height * 0.65, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        button.setTitle("Sunny", for: .normal)
        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        vanVC.view.addSubview(button)
        
        
        tVC.title = "Tokyo"
        tVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "tokyo")!.imageResize(sizeChange: CGSize(width: vanVC.view.frame.size.width, height: vanVC.view.frame.size.height * 0.9)))
        let pic2 : UIView = addImagePic("cloudy")
        pic2.frame = CGRect(x: tVC.view.bounds.width / 2, y: tVC.view.bounds.height / 2, width: 100, height: 100)
        tVC.view.addSubview(pic2)
        let button2: UIButton = UIButton(frame: CGRect(x: tVC.view.bounds.width / 2, y: tVC.view.bounds.height * 0.65, width: 100, height: 50))
        button2.backgroundColor = UIColor.black
        button2.setTitle("Cloudy", for: .normal)
        button2.addTarget(self, action: #selector(pushToNextVC2), for: .touchUpInside)
        tVC.view.addSubview(button2)
        
       
        bjVC.title = "Beijing"
        bjVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "beijing")!.imageResize(sizeChange: CGSize(width: bjVC.view.frame.size.width, height: bjVC.view.frame.size.height * 0.9)))
        let pic3 : UIView = addImagePic("rain")
        pic3.frame = CGRect(x: bjVC.view.bounds.width / 2, y: bjVC.view.bounds.height / 2, width: 100, height: 100)
        bjVC.view.addSubview(pic3)
        let button3: UIButton = UIButton(frame: CGRect(x: bjVC.view.bounds.width / 2, y: bjVC.view.bounds.height * 0.65, width: 100, height: 50))
        button3.backgroundColor = UIColor.black
        button3.setTitle("Rainy", for: .normal)
        button3.addTarget(self, action: #selector(pushToNextVC3), for: .touchUpInside)
        bjVC.view.addSubview(button3)
        
  
        nyVC.title = "NewYork"
        nyVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "newyourk")!.imageResize(sizeChange: CGSize(width: nyVC.view.frame.size.width, height: nyVC.view.frame.size.height * 0.9)))
        let pic4 : UIView = addImagePic("fog")
        pic4.frame = CGRect(x: nyVC.view.bounds.width / 2, y: nyVC.view.bounds.height / 2, width: 100, height: 100)
        nyVC.view.addSubview(pic4)
        let button4: UIButton = UIButton(frame: CGRect(x: nyVC.view.bounds.width / 2, y: nyVC.view.bounds.height * 0.65, width: 100, height: 50))
        button4.backgroundColor = UIColor.black
        button4.setTitle("Foggy", for: .normal)
        button4.addTarget(self, action: #selector(pushToNextVC4), for: .touchUpInside)
        nyVC.view.addSubview(button4)
        
   
        lVC.title = "London"
        lVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "london")!.imageResize(sizeChange: CGSize(width: lVC.view.frame.size.width, height: lVC.view.frame.size.height * 0.9)))
        let pic5 : UIView = addImagePic("wind")
        pic5.frame = CGRect(x: lVC.view.bounds.width / 2, y: lVC.view.bounds.height / 2, width: 100, height: 100)
        lVC.view.addSubview(pic5)
        let button5: UIButton = UIButton(frame: CGRect(x: lVC.view.bounds.width / 2, y: lVC.view.bounds.height * 0.65, width: 100, height: 50))
        button5.backgroundColor = UIColor.black
        button5.setTitle("Windy", for: .normal)
        button5.addTarget(self, action: #selector(pushToNextVC5), for: .touchUpInside)
        lVC.view.addSubview(button5)
        
        
        vanVC.tabBarItem = UITabBarItem(title: vancouver.weatherInform, image: UIImage(named: "Sunny")?.imageResize(sizeChange: CGSize(width: 25, height: 25)), tag: 0)
        tVC.tabBarItem = UITabBarItem(title: tokyo.weatherInform, image: UIImage(named: "cloudy")?.imageResize(sizeChange: CGSize(width: 25, height: 25)), tag: 1)
        bjVC.tabBarItem = UITabBarItem(title: beijing.weatherInform, image: UIImage(named: "rain")?.imageResize(sizeChange: CGSize(width: 25, height: 25)), tag: 2)
        nyVC.tabBarItem = UITabBarItem(title: newYork.weatherInform, image:    UIImage(named: "fog")?.imageResize(sizeChange: CGSize(width: 25, height: 25)), tag: 3)
        lVC.tabBarItem = UITabBarItem(title: london.weatherInform, image: UIImage(named: "wind")?.imageResize(sizeChange: CGSize(width: 25, height: 25)), tag: 4)
        let controller = [vanVC, tVC, bjVC, nyVC, lVC]
        tabBarController.viewControllers = controller.map{UINavigationController(rootViewController: $0)}
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

    func addImagePic(_ weather: String) -> UIImageView {
        var image: UIImage?
        switch weather {
        case "sunny": image = UIImage(named: "Sunny")?.imageResize(sizeChange: CGSize(width: 100, height: 100))
        case "cloudy": image = UIImage(named: "cloudy")?.imageResize(sizeChange: CGSize(width: 100, height: 100))
        case "rain": image = UIImage(named: "rain")?.imageResize(sizeChange: CGSize(width: 100, height: 100))
        case "fog": image = UIImage(named: "fog")?.imageResize(sizeChange: CGSize(width: 100, height: 100))
        case "wind": image = UIImage(named: "wind")?.imageResize(sizeChange: CGSize(width: 100, height: 100))
        default: image = nil
        }
    
        let imageView = UIImageView(image: image)
        
        return imageView
    }
 
    @objc func pushToNextVC() {
        let newVC = vanVC.detailedVC(city: vancouver)
        vanVC.navigationController?.pushViewController(newVC, animated:
            true)
    }
    
    @objc func pushToNextVC2() {
        let newVC = tVC.detailedVC(city: tokyo)
        tVC.navigationController?.pushViewController(newVC, animated:
            true)
    }
    
    @objc func pushToNextVC3() {
        let newVC = bjVC.detailedVC(city: beijing)
        bjVC.navigationController?.pushViewController(newVC, animated:
            true)
    }
    
    @objc func pushToNextVC4() {
        let newVC = nyVC.detailedVC(city: newYork)
        nyVC.navigationController?.pushViewController(newVC, animated:
            true)
    }
    
    @objc func pushToNextVC5() {
        let newVC = lVC.detailedVC(city: london)
        lVC.navigationController?.pushViewController(newVC, animated:
            true)
    }
}

extension UIImage {
    
    func imageResize (sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }
    
}

