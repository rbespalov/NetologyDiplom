//
//  NDTabBarViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        
        view.tintColor = .systemGreen
    }

    private func setupTabBar() {
        
        let feedVC = NDFeedViewController()
        let profileVC = NDProfileViewController()
        let favoritesVC = NDFavoritesViewController()
        
        for vc in [feedVC, profileVC, favoritesVC] {
            vc.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        let nav1 = UINavigationController(rootViewController: feedVC)
        let nav2 = UINavigationController(rootViewController: profileVC)
        let nav3 = UINavigationController(rootViewController: favoritesVC)
        
        nav1.tabBarItem = .init(title: "Главная", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = .init(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 2)
        nav3.tabBarItem = .init(title: "Избранное", image: UIImage(systemName: "heart"), tag: 3)
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }
}
