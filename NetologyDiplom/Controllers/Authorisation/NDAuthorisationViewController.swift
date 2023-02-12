//
//  NDAuthorisationViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDAuthorisationViewController: UIViewController {
    
    private let authView = NDAuthorisationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(authView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            authView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            authView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            authView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            authView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
}
