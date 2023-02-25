//
//  NDPostTableViewCellViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation
import UIKit

final class NDPostTableViewCellViewModel: Hashable, Equatable {
    
    var authorName: String
    var authorAvatar: UIImage
    var authorStatus: String
    var postText: String
    var postImage: UIImage
    var numberOfLikes: Int
    var numberOfComments: Int
    var postDate: Date
    
    init(authorName: String, authorAvatar: UIImage, authorStatus: String, postText: String, postImage: UIImage, numberOfLikes: Int, numberOfComments: Int, postDate: Date) {
        self.authorName = authorName
        self.authorAvatar = authorAvatar
        self.authorStatus = authorStatus
        self.postText = postText
        self.postImage = postImage
        self.numberOfLikes = numberOfLikes
        self.numberOfComments = numberOfComments
        self.postDate = postDate
    }
    
    // MARK: - Hashable
    
    static func == (lhs: NDPostTableViewCellViewModel, rhs: NDPostTableViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        
        hasher.combine(postText)
//        hasher.combine(postDate)
        hasher.combine(numberOfLikes)
        hasher.combine(numberOfComments)
    }
}
