//
//  NDAuthorisationView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

protocol NDAuthorisationViewDelegate: AnyObject {
    func didTapRegister()
    func didTapSingUp()
}

final class NDAuthorisationView: UIView {
    
    public weak var delegate: NDAuthorisationViewDelegate?
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(nil, action: #selector(tapRegister), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        return button
    }()
    
    lazy var singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Уже есть аккаунт", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(nil, action: #selector(didTapSingIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configure() {
        backgroundColor = .systemBackground
        addSubviews(logoImage, registerButton, singInButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let width = UIScreen.main.bounds.width-60
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: width),
            logoImage.heightAnchor.constraint(equalToConstant: width),
            
            registerButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            registerButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            registerButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 50),

            singInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10),
            singInButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            singInButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            singInButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc func tapRegister() {
        delegate?.didTapRegister()
    }
    
    @objc func didTapSingIn() {
        delegate?.didTapSingUp()
    }
}
