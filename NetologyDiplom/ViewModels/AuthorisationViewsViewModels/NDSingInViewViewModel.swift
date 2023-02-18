//
//  NDSingINViewViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 18.02.2023.
//

import Foundation
import UIKit

protocol NDSingInViewViewModelDelegate: AnyObject {
    func userSingIn()
}

final class NDSingInViewViewModel: NSObject {
    
    private let authManager = NDAuthenticationManager.shared
    
    public weak var delegate: NDSingInViewViewModelDelegate?
    
    private var email: String = ""
    private var password: String = ""
    
    public func singInUser() {
        
        authManager.singInUser(userLogin: email, userPassword: password) { result in
            switch result {
            case .success:
                print("OK")
                self.delegate?.userSingIn()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
}

extension NDSingInViewViewModel: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.placeholder == "Email" {
            guard let mail = textField.text else {return}
            email = mail
        }
        
        if textField.placeholder == "Password" {
            guard let pass = textField.text else {return}
            password = pass
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
