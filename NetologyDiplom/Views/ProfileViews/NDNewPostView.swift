//
//  NDNewPostView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 21.02.2023.
//

import UIKit
import FirebaseFirestore

final class NDNewPostView: UIView {

        
    lazy var postTextLabel: UILabel = {
       let label = UILabel()
        label.text = "Ваш пост"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postTextTextField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = .systemFont(ofSize: 18, weight: .light)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var imagePickerButton: UIButton = {
       let button = UIButton()
        button.setTitle("Выберите изображение", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var createPostButton: UIButton = {
        let button = UIButton()
        button.setTitle("Опубликовать", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(createPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configure() {
        backgroundColor = .cyan
        addSubviews(
            postTextTextField,
            imagePickerButton,
            postTextLabel,
            createPostButton
        )
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let pickerheight = UIScreen.main.bounds.width - 30
        let lineheight = postTextLabel.font.lineHeight
        let postTextFieldheight = lineheight*8
        
        NSLayoutConstraint.activate([
            
            postTextLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            postTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            postTextTextField.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 10),
            postTextTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            postTextTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            postTextTextField.heightAnchor.constraint(equalToConstant: postTextFieldheight),
            
            imagePickerButton.topAnchor.constraint(equalTo: postTextTextField.bottomAnchor, constant: 20),
            imagePickerButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            imagePickerButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            imagePickerButton.heightAnchor.constraint(equalToConstant: pickerheight),
            
            createPostButton.topAnchor.constraint(equalTo: imagePickerButton.bottomAnchor, constant: 20),
            createPostButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            createPostButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            createPostButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    @objc private func createPost() {
                        
    }
}


