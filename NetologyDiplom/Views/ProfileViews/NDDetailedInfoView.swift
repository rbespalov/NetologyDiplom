//
//  NDDetailedInfoView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 19.02.2023.
//

import UIKit

class NDDetailedInfoView: UIView {
    
    private let viewModel = NDDetailedInfoViewViewModel()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        
        let textFIeld = UITextField()
        textFIeld.tag = 1
        textFIeld.translatesAutoresizingMaskIntoConstraints = false
        textFIeld.placeholder = "имя"
        textFIeld.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textFIeld.frame.height))
        textFIeld.leftViewMode = .always
        textFIeld.textColor = .systemGray2
        textFIeld.autocapitalizationType = .none
        textFIeld.backgroundColor = .systemGray6
        textFIeld.layer.cornerRadius = 10
        
        textFIeld.returnKeyType = UIReturnKeyType.done
        textFIeld.autocorrectionType = .no
        textFIeld.keyboardType = .default
        
        textFIeld.delegate = viewModel
            
        return textFIeld
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Фамилия"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    private lazy var secondNameTextField: UITextField = {
        
        let textFIeld = UITextField()
        textFIeld.tag = 2
        textFIeld.translatesAutoresizingMaskIntoConstraints = false
        textFIeld.placeholder = "фамилия"
        textFIeld.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textFIeld.frame.height))
        textFIeld.leftViewMode = .always
        textFIeld.textColor = .systemGray2
        textFIeld.autocapitalizationType = .none
        textFIeld.backgroundColor = .systemGray6
        textFIeld.layer.cornerRadius = 10

        
        textFIeld.returnKeyType = UIReturnKeyType.done
        textFIeld.autocorrectionType = .no
        textFIeld.keyboardType = .default
        
        textFIeld.delegate = viewModel
            
        return textFIeld
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    private lazy var maleCheckmark: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "circle"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapMale))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var feemaleCheckmark: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "circle"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapFeemale))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let maleLabel: UILabel = {
        let label = UILabel()
        label.text = "мужской"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    private let feemaleLabel: UILabel = {
        let label = UILabel()
        label.text = "женский"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    private let birthDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    private lazy var birthDateTextField: UITextField = {
        
        let textFIeld = UITextField()
        textFIeld.tag = 3
        textFIeld.translatesAutoresizingMaskIntoConstraints = false
        textFIeld.placeholder = "ваша дата рождения"
        textFIeld.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textFIeld.frame.height))
        textFIeld.leftViewMode = .always
        textFIeld.textColor = .systemGray2
        textFIeld.autocapitalizationType = .none
        textFIeld.backgroundColor = .systemGray6
        textFIeld.layer.cornerRadius = 10

        
        textFIeld.returnKeyType = UIReturnKeyType.done
        textFIeld.autocorrectionType = .no
        textFIeld.keyboardType = .default
        
        textFIeld.delegate = viewModel
            
        return textFIeld
    }()
    
    private let homeTownLabel: UILabel = {
        let label = UILabel()
        label.text = "Родной город"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    private lazy var homeTownTextField: UITextField = {
        
        let textFIeld = UITextField()
        textFIeld.tag = 4
        textFIeld.translatesAutoresizingMaskIntoConstraints = false
        textFIeld.placeholder = " введите город"
        textFIeld.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textFIeld.frame.height))
        textFIeld.leftViewMode = .always
        textFIeld.textColor = .systemGray2
        textFIeld.autocapitalizationType = .none
        textFIeld.backgroundColor = .systemGray6
        textFIeld.layer.cornerRadius = 10

        
        textFIeld.returnKeyType = UIReturnKeyType.done
        textFIeld.autocorrectionType = .no
        textFIeld.keyboardType = .default
        
        textFIeld.delegate = viewModel
            
        return textFIeld
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        addSubviews(nameLabel, nameTextField, secondNameLabel, secondNameTextField, genderLabel, maleLabel, maleCheckmark, feemaleLabel, feemaleCheckmark, birthDateLabel, birthDateTextField, homeTownLabel, homeTownTextField)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            secondNameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            secondNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 10),
            secondNameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            secondNameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            genderLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 20),
            genderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            maleCheckmark.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            maleCheckmark.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            maleLabel.leftAnchor.constraint(equalTo: maleCheckmark.rightAnchor, constant: 5),
            maleLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            
            feemaleCheckmark.topAnchor.constraint(equalTo: maleCheckmark.bottomAnchor, constant: 10),
            feemaleCheckmark.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            feemaleLabel.leftAnchor.constraint(equalTo: feemaleCheckmark.rightAnchor, constant: 5),
            feemaleLabel.topAnchor.constraint(equalTo: maleLabel.bottomAnchor, constant: 10),
            
            birthDateLabel.topAnchor.constraint(equalTo: feemaleLabel.bottomAnchor, constant: 20),
            birthDateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            birthDateTextField.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor, constant: 10),
            birthDateTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            birthDateTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            birthDateTextField.heightAnchor.constraint(equalToConstant: 30),
            
            homeTownLabel.topAnchor.constraint(equalTo: birthDateTextField.bottomAnchor, constant: 20),
            homeTownLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            homeTownTextField.topAnchor.constraint(equalTo: homeTownLabel.bottomAnchor, constant: 10),
            homeTownTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            homeTownTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            homeTownTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc func tapMale() {
        NDFirestroreManager.shared.setDataForUser(userLogin: NDUserManager.shared.currentUser.login, dataType: "gender", dataValue: "male")
        maleCheckmark.image = UIImage(systemName: "smallcircle.filled.circle")
        maleCheckmark.tintColor = .systemGreen
        feemaleCheckmark.image = UIImage(systemName: "circle")
        feemaleCheckmark.tintColor = .systemGray2
        NDUserManager.shared.currentUser.gender = "male"
    }
    
    @objc func tapFeemale() {
        NDFirestroreManager.shared.setDataForUser(userLogin: NDUserManager.shared.currentUser.login, dataType: "gender", dataValue: "feemale")
        feemaleCheckmark.image = UIImage(systemName: "smallcircle.filled.circle")
        feemaleCheckmark.tintColor = .systemGreen
        maleCheckmark.image = UIImage(systemName: "circle")
        maleCheckmark.tintColor = .systemGray2
        NDUserManager.shared.currentUser.gender = "feemale"
    }
}
