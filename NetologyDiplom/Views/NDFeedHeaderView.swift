//
//  NDFeedHeaderView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import UIKit

class NDFeedHeaderView: UIView {
    
    let viewModel = NDFeedHeadViewCollectionViewViewModel()
    
    private let newsLabel: UILabel = {
       let lablel = UILabel()
        lablel.attributedText = NSAttributedString(string: "Новости", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        lablel.translatesAutoresizingMaskIntoConstraints = false
        return lablel
    }()
    
    private let forYouLabel: UILabel = {
       let label = UILabel()
        label.text = "Для вас"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NDFeedHeadViewCollectionViewCell.self, forCellWithReuseIdentifier: NDFeedHeadViewCollectionViewCell.cellIdentifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red
        addSubviews(newsLabel, forYouLabel, collectionView)
        setupConstraints()
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            newsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            forYouLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            forYouLabel.leftAnchor.constraint(equalTo: newsLabel.rightAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
}
