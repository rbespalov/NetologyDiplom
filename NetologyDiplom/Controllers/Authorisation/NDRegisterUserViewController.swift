//
//  NDRegisterUserViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDRegisterUserViewController: UIViewController {
    
    private var registerView: NDRegisterUserView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! NDRegisterUserView)
    }
    
    private var model = NDUserModel(loginEmail: "", nickName: "")
    
    override func loadView() {
        super.loadView()
        
        let registerView = NDRegisterUserView()
        registerView.configure()
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        registerView.delegate = self
//        registerView.loginTextField.delegate = self
//        registerView.passwordTextField.delegate = self
//        registerView.userNameTextFIeld.delegate = self
    }

}

//extension NDRegisterUserViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        if textField.placeholder == "Email" {
//            guard let mail = textField.text else {return}
//            model.loginEmail = mail
//        }
        
//        if textField.placeholder == "Password" {
//            guard let pass = textField.text else {return}
////            password = pass
//        }
        
//        if textField.placeholder == "Name" {
//            guard let name = textField.text else {return}
//            model.nickName = name
//        }
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//    }
//}

extension NDRegisterUserViewController: NDRegisterUserViewDelegate {
    func registerTapped() {
        guard let login = registerView.loginTextField.text else { return }
        guard let password = registerView.passwordTextField.text else { return }
        NDAuthenticationManager.shared.createUser(
            userLogin: login,
            userPassword: password
        ) { result in
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
