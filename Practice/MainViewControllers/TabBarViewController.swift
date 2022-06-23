//
//  MainViewController.swift
//  Practice
//
//  Created by MAC on 22.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UINavigationController(rootViewController: FirstViewController())
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        firstVC.navigationBar.backgroundColor = .systemBackground
        secondVC.navigationBar.backgroundColor = .systemBackground

        self.setViewControllers([firstVC, secondVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = .systemBackground

        firstVC.title = "First"
        secondVC.title = "Second"
        
        firstVC.tabBarItem.image = UIImage(systemName: "house")
        secondVC.tabBarItem.image = UIImage(systemName: "car")

        
    }
}

