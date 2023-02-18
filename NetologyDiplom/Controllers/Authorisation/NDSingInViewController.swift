//
//  NDSingInViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDSingInViewController: UIViewController {

    private let singInView = NDSingInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(singInView)
        setupConstraints()
        view.backgroundColor = .systemBackground
        singInView.delegate = self
    }

    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            singInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            singInView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            singInView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            singInView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

        ])
    }
}

extension NDSingInViewController: NDSingInViewDelegate {
    func userSingIn() {
        let tabBarVC = NDTabBarController()
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.setViewControllers([tabBarVC], animated: true)
    }
}
