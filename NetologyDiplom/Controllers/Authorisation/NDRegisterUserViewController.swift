//
//  NDRegisterUserViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDRegisterUserViewController: UIViewController {
    
    private let registerView = NDRegisterUserView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerView)
        setupConstraints()
    }

    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            registerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            registerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            registerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

        ])
        
    }
    
}
