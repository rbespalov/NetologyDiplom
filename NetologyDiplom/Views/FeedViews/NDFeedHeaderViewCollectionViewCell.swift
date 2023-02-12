//
//  NDFeedHeadViewCollectionViewCell.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import UIKit

class NDFeedHeaderViewCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "NDFeedHeadViewCollectionViewCell"
        
    private let friendAvatar: UIImageView = {
        let avatar = UIImageView()
        avatar.contentMode = .scaleAspectFit
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.layer.cornerRadius = 32
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.systemGreen.cgColor
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(friendAvatar)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            friendAvatar.topAnchor.constraint(equalTo: contentView.topAnchor),
            friendAvatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            friendAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            friendAvatar.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure (with viewModel: NDFeedHeadViewCollectionViewCellViewModel) {
        friendAvatar.image = UIImage(named: viewModel.friendAvatar)
    }
}
