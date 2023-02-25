//
//  NDPostModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation

struct NDPostModel: Codable {
    var authorName: String
    var authorAvatar: String?
    var authorStatus: String
    var postText: String
    var postImage: String
    var numberOfLikes: Int = Int.random(in: 1..<100)
    var numberOfComments: Int = Int.random(in: 1..<100)
    var postDate: Date = .now
}
