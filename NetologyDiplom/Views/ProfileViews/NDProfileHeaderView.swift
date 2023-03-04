//
//  NDProfileHeaderView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import UIKit

protocol NDProfileHeaderViewDelegate: AnyObject {
    func didTapDetailUserInfo()
    func createPost()
}

class NDProfileHeaderView: UIView {
    
    private let viewModel = NDProfileHeaderViewViewModel()
    
    public weak var delegate: NDProfileHeaderViewDelegate?
    
    private var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private var status: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exclamationImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "exclamationmark.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(showDetailed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var detailedInformation: UIButton = {
        let button = UIButton()
        button.setTitle("Подробная информация", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(showDetailed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true

        return button
    }()
    
    private var editDetailedInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Редактировать", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var numberOfPosts: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "123"
        return label
    }()
    
    private var numberOfSubscriptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "321"
        return label
    }()
    
    private var numberOfSubscribers: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "333"
        return label
    }()
    
    private var numberOfPostsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "публикаций"
        return label
    }()
    
    private var numberOfSubscriptionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "подписок"
        return label
    }()
    
    private var numberOfSubscribersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "подписчиков"
        return label
    }()
    
    private lazy var numberOfPostsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubview(numberOfPosts)
        stackView.addArrangedSubview(numberOfPostsLabel)
        return stackView
    }()
    
    private lazy var numberOfSubscriptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubview(numberOfSubscriptions)
        stackView.addArrangedSubview(numberOfSubscriptionsLabel)
        return stackView
    }()
    
    private lazy var numberOfSubscribersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubview(numberOfSubscribers)
        stackView.addArrangedSubview(numberOfSubscribersLabel)
        return stackView
    }()
    
    private var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var postLabel: UILabel = {
        let label = UILabel()
        label.text = "Запись"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var storyLabel: UILabel = {
        let label = UILabel()
        label.text = "История"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Фото"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var noteimage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "square.and.pencil"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame.size = CGSize(width: 75, height: 75)
        return image
    }()
    
    private var storyimage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "camera"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var photoimage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "photo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubview(noteimage)
        stackView.addArrangedSubview(postLabel)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(createPost))
        stackView.addGestureRecognizer(gesture)
        return stackView
    }()
    
    private lazy var storyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubview(storyimage)
        stackView.addArrangedSubview(storyLabel)
        return stackView
    }()
    
    private lazy var photoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubview(photoimage)
        stackView.addArrangedSubview(photoLabel)
        return stackView
    }()
    
    private var myPhotosLabel: UILabel = {
        let label = UILabel()
        label.text = "Фотографии"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myPhotoCount: UILabel = {
        let label = UILabel()
        label.text = "15"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NDProfileHeaderViewCollectionViewCell.self, forCellWithReuseIdentifier: NDProfileHeaderViewCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    private var goToMyPhotoButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var myPostsLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои записи"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myPostSearchImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var myPostsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(myPostsLabel)
        stackView.addArrangedSubview(myPostSearchImage)
        stackView.backgroundColor = .systemGray3
        return stackView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        
        
        addSubviews(avatar, name, status, detailedInformation, exclamationImage, editDetailedInfoButton, numberOfPostsStackView, numberOfSubscribersStackView, numberOfSubscriptionsStackView, separator, postStackView, storyStackView, photoStackView,
        myPhotoCount, myPhotosLabel, goToMyPhotoButton, myPostsStackView, collectionView)
        
        setupConstraints()
        setUpView()
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            avatar.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            avatar.heightAnchor.constraint(equalToConstant: 50),
            avatar.widthAnchor.constraint(equalToConstant: 50),
            
            name.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            name.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 15),

            status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            status.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 15),
            
            detailedInformation.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 10),
            detailedInformation.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            exclamationImage.rightAnchor.constraint(equalTo: detailedInformation.leftAnchor, constant: -5),
            exclamationImage.centerYAnchor.constraint(equalTo: detailedInformation.centerYAnchor),
            
            editDetailedInfoButton.topAnchor.constraint(equalTo: detailedInformation.bottomAnchor, constant: 10),
            editDetailedInfoButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            editDetailedInfoButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            editDetailedInfoButton.heightAnchor.constraint(equalToConstant: 50),
            
            numberOfPostsStackView.topAnchor.constraint(equalTo: editDetailedInfoButton.bottomAnchor, constant: 10),
            numberOfPostsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            numberOfSubscriptionsStackView.topAnchor.constraint(equalTo: editDetailedInfoButton.bottomAnchor, constant: 10),
            numberOfSubscriptionsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfSubscribersStackView.topAnchor.constraint(equalTo: editDetailedInfoButton.bottomAnchor, constant: 10),
            numberOfSubscribersStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            separator.topAnchor.constraint(equalTo: numberOfSubscriptionsStackView.bottomAnchor, constant: 10),
            separator.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            separator.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            postStackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            postStackView.centerXAnchor.constraint(equalTo: numberOfPosts.centerXAnchor),
            
            storyStackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            storyStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            photoStackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            photoStackView.centerXAnchor.constraint(equalTo: numberOfSubscribersStackView.centerXAnchor),
            
            myPhotosLabel.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 20),
            myPhotosLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            myPhotoCount.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 20),
            myPhotoCount.leftAnchor.constraint(equalTo: myPhotosLabel.rightAnchor, constant: 5),
            
            goToMyPhotoButton.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 20),
            goToMyPhotoButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: myPhotosLabel.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            myPostsStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            myPostsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            myPostsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            myPostsStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpView() {
        
        avatar.image = UIImage(named: "rick")
        status.text = "WabbalaabbaDubDub"
        
//        name.text = viewModel.currentUser.nickName
    }
    
    @objc private func showDetailed() {
        delegate?.didTapDetailUserInfo()
    }
    
    @objc private func createPost() {
        delegate?.createPost()
        
    }
}
