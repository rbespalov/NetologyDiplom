//
//  NDProfileHeaderViewCollectionViewCell.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 12.02.2023.
//

import UIKit

class NDProfileHeaderViewCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "NDProfileHeaderViewCollectionViewCell"
    
    private let photoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImage)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photoImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure (with viewModel: NDProfileHeaderViewCollectionViewCellViewModel) {
        photoImage.image = UIImage(named: viewModel.photoImage)
    }
}
