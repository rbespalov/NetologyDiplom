//
//  NDPostTableViewCell.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

class NDPostTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "NDPostTableViewCell"
    
    //MARK: - Private
    
    lazy var authorAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var authorStatus: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postText: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        label.lineBreakMode = .byWordWrapping
        label.clipsToBounds = true
        
         return label
     }()
    
    lazy var postImage: UIImageView = {
        let postImage = UIImageView()
         postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.contentMode = .scaleAspectFit
        postImage.clipsToBounds = true
        
         return postImage
     }()
    
    lazy var numberOfLikes: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    lazy var likeImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "heart"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var numberOfComments: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    lazy var commentImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "message"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var postDate: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    lazy var bookmarkImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "bookmark"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var ellipsisImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "ellipsis"))
        image.transform = image.transform.rotated(by: .pi/2)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    //MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(authorAvatar, authorName, authorStatus, postText, postImage, likeImage, numberOfLikes, commentImage, numberOfComments, postDate, bookmarkImage, ellipsisImage)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .systemGray5
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowColor = UIColor.systemGray2.cgColor
        addConstraints()

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            postDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postDate.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            authorAvatar.topAnchor.constraint(equalTo: postDate.bottomAnchor, constant: 10),
            authorAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            authorAvatar.heightAnchor.constraint(equalToConstant: 50),
            authorAvatar.widthAnchor.constraint(equalToConstant: 50),
            
            authorName.topAnchor.constraint(equalTo: postDate.bottomAnchor,constant: 10),
            authorName.leftAnchor.constraint(equalTo: authorAvatar.rightAnchor, constant: 15),

            authorStatus.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 5),
            authorStatus.leftAnchor.constraint(equalTo: authorAvatar.rightAnchor, constant: 15),
            
            ellipsisImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            ellipsisImage.topAnchor.constraint(equalTo: postDate.bottomAnchor, constant: 10),
            
            postText.topAnchor.constraint(equalTo: authorStatus.bottomAnchor, constant: 20),
            postText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            postText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            postImage.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 10),
            postImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            postImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            likeImage.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            likeImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            likeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            numberOfLikes.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            numberOfLikes.leftAnchor.constraint(equalTo: likeImage.rightAnchor, constant: 10),
            numberOfLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            commentImage.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            commentImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            commentImage.leftAnchor.constraint(equalTo: numberOfLikes.rightAnchor, constant: 20),
            
            numberOfComments.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            numberOfComments.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            numberOfComments.leftAnchor.constraint(equalTo: commentImage.rightAnchor, constant: 10),
            
            bookmarkImage.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            bookmarkImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bookmarkImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    

    
    public func configure() {
        //add cell setup
    }
}
