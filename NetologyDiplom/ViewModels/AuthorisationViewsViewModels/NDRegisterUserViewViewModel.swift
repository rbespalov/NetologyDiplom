//
//  NDRegisterUserViewViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 16.02.2023.
//

import Foundation
import UIKit

protocol NDRegisterUserViewViewModelDelegate: AnyObject {
    func userRegistred()
}

final class NDRegisterUserViewViewModel: NSObject {
    
    private let authManager = NDAuthenticationManager.shared
    
    private let dataBaseManager = NDFirestroreManager.shared
    
    public weak var delegate: NDRegisterUserViewViewModelDelegate?
    
    private var name: String = ""
    private var email: String = ""
    private var password: String = ""
    
    public func registerUser() {
                
        authManager.createUser(userLogin: email, userPassword: password) { result in
            switch result {
            case .success:
                self.dataBaseManager.getCurrentUser(userLogin: self.email)
                self.delegate?.userRegistred()
                self.dataBaseManager.createUser(userLogin: self.email, password: self.password, userName: self.name)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension NDRegisterUserViewViewModel: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.placeholder == "Email" {
            guard let mail = textField.text else {return}
            email = mail
        }
        
        if textField.placeholder == "Password" {
            guard let pass = textField.text else {return}
            password = pass
        }
        
        if textField.placeholder == "Name" {
            guard let name = textField.text else {return}
            self.name = name
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
