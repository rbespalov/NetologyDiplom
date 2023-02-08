//
//  NDPostTableViewCell.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

class NDPostTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "NDPostTableViewCell"
    
    private var authorAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private var authorStatus: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var postText: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    private var postImage: UIImageView = {
        let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         return image
     }()
    
    private var numberOfLikes: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    private var numberOfComments: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    private var postDate: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubviews(authorName,authorStatus,authorAvatar,numberOfLikes,numberOfComments,postText,postImage, postDate)
        contentView.addSubviews(authorName,authorStatus)
        addConstraints()

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            authorName.topAnchor.constraint(equalTo: contentView.topAnchor),
            authorName.heightAnchor.constraint(equalToConstant: 50),
            authorName.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            authorName.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    
    public func configure(with viewModel: NDPostTableViewCellViewModel) {
        authorName.text = viewModel.authorName
        authorStatus.text = viewModel.authorStatus
    }
}
