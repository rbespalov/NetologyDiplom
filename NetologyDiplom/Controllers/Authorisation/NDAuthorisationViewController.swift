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
        view.backgroundColor = .systemBackground
        authView.delegate = self
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

extension NDAuthorisationViewController: NDAuthorisationViewDelegate {
    func didTapRegister() {
        let regVC = NDRegisterUserViewController()
        navigationController?.pushViewController(regVC, animated: true)
    }
    
    func didTapSingUp() {
        let singIN = NDSingInViewController()
        navigationController?.pushViewController(singIN, animated: true)
    }
    
    
}
