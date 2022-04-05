//
//  TabBarCon.swift
//  Navigation
//
//  Created by antonfrolov on 05.04.2022.
//

import UIKit

class TabBarCon: UITabBarController {
    
    let firstVC = ViewCon1()
    let secondVC = ViewCon2()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        setupCon()
    }
    
    private func setupCon() {
        firstVC.tabBarItem.title = "Лента"
        firstVC.tabBarItem.image = UIImage(systemName: "bolt")
        firstVC.navigationItem.title = "Лента пользователя"
        
        secondVC.tabBarItem.title = "Профиль"
        secondVC.tabBarItem.image = UIImage(systemName: "note")
        secondVC.navigationItem.title = "Профиль пользователя"
        
        let navController1 = UINavigationController(rootViewController: firstVC)
        let navController2 = UINavigationController(rootViewController: secondVC)
        
        viewControllers = [navController1, navController2]
    }

}
