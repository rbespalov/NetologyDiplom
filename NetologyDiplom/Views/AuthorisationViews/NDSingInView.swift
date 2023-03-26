//
//  NDSingInView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 18.02.2023.
//

import UIKit

protocol SingInViewDelegate: AnyObject{
    func singInTapped()
}

final class NDSingInView: UIView {
    
    weak var delegate: SingInViewDelegate?
    
    lazy var singInLabel: UILabel = {
       let label = UILabel()
        label.text = "ВОЙТИ"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)

        return stackView
    }()
    
    lazy var singInButton: UIButton = {
       let button = UIButton()
        button.setTitle("ВОЙТИ", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.addTarget(nil, action: #selector(singIn), for: .touchUpInside)
        return button
    }()
    
    func configure() {
        backgroundColor = .systemBackground
        addSubviews(singInLabel,stackView,singInButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            singInLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            singInLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 30),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            singInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            singInButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            singInButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            singInLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    @objc private func singIn() {
        loginTextField.endEditing(true)
        passwordTextField.endEditing(true)
        delegate?.singInTapped()
    }
}

