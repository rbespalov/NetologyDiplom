//
//  SceneDelegate.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
//        let tabBar = NDDetailedUserInfoViewController()
//        let tabBar = NDRegisterUserViewController()
//        let tabBar = NDSingInViewController()
//        let tabBar = NDAuthorisationViewController()
//        let tabBar = NDNewPostViewController()
//        let nav = NDTabBarController()
//        let nav = UINavigationController(rootViewController: tabBar)
        
        let currenUserID = UserDefaults.standard.string(forKey: "currentUserId")
        if currenUserID != "" {
            print("has user")
            let tabBar = NDTabBarController()
            let nav = UINavigationController(rootViewController: tabBar)
            window.rootViewController = nav
        } else {
            print("empty user")
            let tabBar = NDAuthorisationViewController()
            let nav = UINavigationController(rootViewController: tabBar)
            window.rootViewController = nav
        }
        
        self.window = window
//        window.rootViewController = nav
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
//        do {
//            try NDAuthenticationManager.shared.manager.signOut()
//            UserDefaults.standard.set("", forKey: "currentUserId")
//        }
//        catch {
//            return
//        }

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

