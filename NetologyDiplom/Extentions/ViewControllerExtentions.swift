//
//  ViewControllerExtentions.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 18.03.2023.
//

import Foundation
import UIKit
import FirebaseAuth

extension UIViewController{
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode.Code(rawValue: error._code) {
            let alert = UIAlertController(title: "Ошибка", message: errorCode.errorMessage, preferredStyle: .alert)

            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

            alert.addAction(okAction)

            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = { }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
