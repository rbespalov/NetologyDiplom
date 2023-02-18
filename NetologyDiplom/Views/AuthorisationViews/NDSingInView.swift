//
//  NDSingInView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 18.02.2023.
//

import UIKit

protocol NDSingInViewDelegate: AnyObject {
    func userSingIn()
}

class NDSingInView: UIView {

    private let authManager = NDAuthenticationManager.shared
    
    private let viewModel = NDSingInViewViewModel()
    
    public weak var delegate: NDSingInViewDelegate?
    
    private let singInLabel: UILabel = {
       let label = UILabel()
        label.text = "ВОЙТИ"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginTextField: UITextField = {

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
        loginTextField.keyboardType = .emailAddress
        
        loginTextField.delegate = viewModel
            
        return loginTextField
    }()
    
    
    private lazy var passwordTextField: UITextField = {
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
        passwordTextField.keyboardType = .namePhonePad
        passwordTextField.isSecureTextEntry = true
        
        passwordTextField.delegate = viewModel
        
        return passwordTextField
    }()
    
    private lazy var stackView: UIStackView = {

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
    
    private var singInButton: UIButton = {
       let button = UIButton()
        button.setTitle("ВОЙТИ", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.addTarget(nil, action: #selector(register), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(singInLabel,stackView,singInButton)
        setupConstraints()
        viewModel.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            singInLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
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
    
    @objc private func register() {
        loginTextField.endEditing(true)
        passwordTextField.endEditing(true)
        viewModel.singInUser()
    }
    
}

extension NDSingInView: NDSingInViewViewModelDelegate {
    func userSingIn() {
        delegate?.userSingIn()
    }
    
    
}
