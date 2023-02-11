//
//  NDCommentModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 08.02.2023.
//

import Foundation

struct NDCommentModel {
    let ID = UUID().uuidString
    var authorName: String
    var authorAvatar: String
    var numberOfLikes: Int
}
