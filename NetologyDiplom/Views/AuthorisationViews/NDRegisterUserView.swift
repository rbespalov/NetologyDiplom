//
//  NDRegisterUserView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit
import FirebaseAuth

protocol NDRegisterUserViewDelegate: AnyObject {
    func registerTapped()
}

final class NDRegisterUserView: UIView {
    
    weak var delegate: NDRegisterUserViewDelegate?
    
    lazy var registerLabel: UILabel = {
       let label = UILabel()
        label.text = "ЗАРЕГИСТРИРОВАТЬСЯ"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userNameTextFIeld: UITextField = {

        let userNameTextFIeld = UITextField()
        
        userNameTextFIeld.translatesAutoresizingMaskIntoConstraints = false
        
        userNameTextFIeld.placeholder = "Name"
        userNameTextFIeld.leftView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 15,
                height: userNameTextFIeld.frame.height
            )
        )
        userNameTextFIeld.leftViewMode = .always
        userNameTextFIeld.textColor = .black
        userNameTextFIeld.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        userNameTextFIeld.tintColor = UIColor(named: "AccentColor")
        userNameTextFIeld.autocapitalizationType = .none
        userNameTextFIeld.backgroundColor = .systemGray6
        
        userNameTextFIeld.layer.borderColor = UIColor.lightGray.cgColor
        userNameTextFIeld.layer.borderWidth = 0.5
        userNameTextFIeld.returnKeyType = UIReturnKeyType.done
        userNameTextFIeld.autocorrectionType = .no
        userNameTextFIeld.keyboardType = .emailAddress
                    
        return userNameTextFIeld
    }()
    
    lazy var loginTextField: UITextField = {

        let loginTextField = UITextField()
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.placeholder = "Email"
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.tintColor = UIColor(named: "AccentColor")
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemGray6
        
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.returnKeyType = UIReturnKeyType.done
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = .default
                    
        return loginTextField
    }()
    
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.placeholder = "Password"
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.tintColor = UIColor(named: "AccentColor")
        passwordTextField.autocapitalizationType = .none
        passwordTextField.backgroundColor = .systemGray6
        
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.autocorrectionType = .no
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
                
        return passwordTextField
    }()
    
    lazy var stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill

        stackView.addArrangedSubview(userNameTextFIeld)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)

        return stackView
    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.addTarget(nil, action: #selector(register), for: .touchUpInside)
        return button
    }()
    
    func configure() {
        backgroundColor = .systemBackground
        addSubviews(registerLabel,stackView,registerButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            registerButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            registerButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            registerLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func register() {
        loginTextField.endEditing(true)
        passwordTextField.endEditing(true)
        userNameTextFIeld.endEditing(true)
        delegate?.registerTapped()
    }
}
