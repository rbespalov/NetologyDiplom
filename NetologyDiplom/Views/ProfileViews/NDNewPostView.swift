//
//  NDNewPostView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 21.02.2023.
//

import UIKit

protocol NDNewPostViewDelegate: AnyObject {
    func showPicker(picker: UIImagePickerController)
}

class NDNewPostView: UIView {
    
    private let viewModel = NDNewPostViewViewModel()
    
    public weak var delegate: NDNewPostViewDelegate?
    
    private var postTextLabel: UILabel = {
       let label = UILabel()
        label.text = "Ваш пост"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postTextTextField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = .systemFont(ofSize: 18, weight: .light)
        textView.delegate = viewModel
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var imagePickerButton: UIButton = {
       let button = UIButton()
        button.setTitle("Выберите изображение", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        return button
    }()
    
    private var createPostButton: UIButton = {
        let button = UIButton()
        button.setTitle("Опубликовать", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .cyan
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(postTextTextField, imagePickerButton, postTextLabel, createPostButton)
        setupConstraints()
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        let pickerheight = UIScreen.main.bounds.width - 30
        let lineheight = postTextLabel.font.lineHeight
        let postTextFieldheight = lineheight*8
        
        NSLayoutConstraint.activate([
            
            postTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
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
    
    @objc private func pickImage() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
//        picker.allowsEditing = true
//        let OK = UIBarButtonItem(title: "OK", style: .done, target: nil, action: nil)
//        picker.navigationItem.rightBarButtonItem = OK
        picker.delegate = viewModel
        delegate?.showPicker(picker: picker)
    }
}

extension NDNewPostView: NDNewPostViewViewModelDelegate {
    func imagePicked(image: UIImage) {
        DispatchQueue.main.async {
            self.imagePickerButton.setImage(image, for: .normal)
        }
    }
    

    
    
}
