//
//  NDPostModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation

struct NDPostModel {
    let ID: String = UUID().uuidString
    var authorName: String
    var authorAvatar: String
    var authorStatus: String
    var postText: String
    var postImage: String
    var numberOfLikes: Int
    var numberOfComments: Int
    var postDate: Date
    var comments: [NDCommentModel]
    
}
