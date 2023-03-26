//
//  NDDetailedUserInfoViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 19.02.2023.
//

import UIKit

class NDDetailedUserInfoViewController: UIViewController {
    
    private var detailedView: NDDetailedInfoView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! NDDetailedInfoView)
    }
    
    
    override func loadView() {
        super.loadView()
        
        let detailedView = NDDetailedInfoView()
        detailedView.configure()
        
        view = detailedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(detailedView)
//        setUpConstraints()
        detailedView.nameTextField.delegate = self
        detailedView.homeTownTextField.delegate = self
        detailedView.birthDateTextField.delegate = self
        detailedView.secondNameTextField.delegate = self
    }
    
//    private func setUpConstraints() {
//        NSLayoutConstraint.activate([
//            detailedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            detailedView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            detailedView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            detailedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }

}

extension NDDetailedUserInfoViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField.tag == 1 {
            guard let text = textField.text else { return }
            textField.text = text
            textField.textColor = .label
        }
        
        if textField.tag == 2 {
            guard let text = textField.text else { return }
            textField.text = text
            textField.textColor = .label
        }
        
        if textField.tag == 3 {
            guard let text = textField.text else { return }
            textField.text = text
            textField.textColor = .label
        }
        
        if textField.tag == 4 {
            guard let text = textField.text else { return }
            textField.text = text
            textField.textColor = .label
        }
    }
}
