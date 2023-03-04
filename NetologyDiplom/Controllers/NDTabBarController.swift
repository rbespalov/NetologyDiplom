//
//  NDTabBarViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDTabBarController: UITabBarController {
    
    public var currenUser: NDUserModel
    
    init(currenUser: NDUserModel) {
        self.currenUser = currenUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        
        view.tintColor = .systemGreen
    }

    private func setupTabBar() {
        
        let feedVC = NDFeedViewController(currenUser: currenUser)
        let profileVC = NDProfileViewController(currentUser: currenUser)
        let favoritesVC = NDFavoritesViewController(currentUser: currenUser)
        
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
