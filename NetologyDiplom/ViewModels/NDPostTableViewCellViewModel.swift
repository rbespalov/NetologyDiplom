//
//  NDPostTableViewCellViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation

final class NDPostTableViewCellViewModel {
    
    var authorName: String
    var authorAvatar: String
    var authorStatus: String
    var postText: String
    var postImage: String
    var numberOfLikes: Int
    var numberOfComments: Int
    var postDate: Date
    
    init(authorName: String, authorAvatar: String, authorStatus: String, postText: String, postImage: String, numberOfLikes: Int, numberOfComments: Int, postDate: Date) {
        self.authorName = authorName
        self.authorAvatar = authorAvatar
        self.authorStatus = authorStatus
        self.postText = postText
        self.postImage = postImage
        self.numberOfLikes = numberOfLikes
        self.numberOfComments = numberOfComments
        self.postDate = postDate
    }
}
