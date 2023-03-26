//
//  NDAuthorisationViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDAuthorisationViewController: UIViewController {
    
    private var authView: NDAuthorisationView! {
        guard isViewLoaded else {
            return nil
        }
        return (view as! NDAuthorisationView)
    }
    
    override func loadView() {
        super.loadView()
        
        let authView = NDAuthorisationView()
        authView.configure()
        view = authView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        authView.delegate = self
    }
    
    @objc func registerUserTapped() {
        print("register user")
    }

}

extension NDAuthorisationViewController: NDAuthorisationViewDelegate {
    func didTapRegister() {
        let registerVC = NDRegisterUserViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func didTapSingUp() {
        let singInVC = NDSingInViewController()
        navigationController?.pushViewController(singInVC, animated: true)
    }
    
    
}

