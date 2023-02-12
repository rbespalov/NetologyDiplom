//
//  NDAuthorisationView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDAuthorisationView: UIView {
    
    private var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var registerButton: UIButton = {
       let button = UIButton()
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        return button
    }()
    
    private var singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Уже есть аккаунт", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(logoImage, registerButton, singInButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        let width = UIScreen.main.bounds.width-60
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
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
}
