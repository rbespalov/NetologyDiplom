//
//  NDDetailedInfoViewViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 19.02.2023.
//

import Foundation
import UIKit

final class NDDetailedInfoViewViewModel: NSObject {
    let userManager = NDUserManager.shared
    let fireStore = NDFirestroreManager.shared
    
    
}

extension NDDetailedInfoViewViewModel: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField.tag == 1 {
            guard let text = textField.text else { return }
            fireStore.setDataForUser(userLogin: userManager.currentUser.login, dataType: "firstName", dataValue: text)
            textField.text = text
            textField.textColor = .label
            userManager.currentUser.firstName = text
        }
        
        if textField.tag == 2 {
            guard let text = textField.text else { return }
            fireStore.setDataForUser(userLogin: userManager.currentUser.login, dataType: "secondName", dataValue: text)
            textField.text = text
            textField.textColor = .label
            userManager.currentUser.secondName = text
        }
        
        if textField.tag == 3 {
            guard let text = textField.text else { return }
            fireStore.setDataForUser(userLogin: userManager.currentUser.login, dataType: "dateOfBirth", dataValue: text)
            textField.text = text
            textField.textColor = .label
            userManager.currentUser.birthDate = text
        }
        
        if textField.tag == 4 {
            guard let text = textField.text else { return }
            fireStore.setDataForUser(userLogin: userManager.currentUser.login, dataType: "homeTown", dataValue: text)
            textField.text = text
            textField.textColor = .label
            userManager.currentUser.birthDate = text
        }
    }
}
