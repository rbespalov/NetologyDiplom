//
//  NDSingInViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDSingInViewController: UIViewController {

    private var singInView: NDSingInView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! NDSingInView)
    }
    
    override func loadView() {
        super.loadView()
        
        let singInView = NDSingInView()
        singInView.configure()
        view = singInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        singInView.delegate = self
//        singInView.passwordTextField.delegate = self
//        singInView.loginTextField.delegate = self
    }
}

//extension NDSingInViewController: UITextFieldDelegate {
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        if textField.placeholder == "Email" {
//            guard let mail = textField.text else {return}
//        }
//
//        if textField.placeholder == "Password" {
//            guard let pass = textField.text else {return}
//        }
//
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//    }
//
//}

extension NDSingInViewController: SingInViewDelegate {
    func singInTapped() {
        guard let login = singInView.loginTextField.text else {return}
        guard let password = singInView.passwordTextField.text else {return}
        NDAuthenticationManager.shared.singInUser(userLogin: login, userPassword: password) { result in
            switch result {
            case .success:
                let tabbar = NDTabBarController()
                self.navigationController?.isNavigationBarHidden = true
                self.navigationController?.pushViewController(tabbar, animated: true)
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
}
