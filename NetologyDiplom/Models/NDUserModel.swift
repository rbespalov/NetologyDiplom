//
//  NDUserModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation

struct NDUserModel {
    let ID: String = UUID().uuidString
    var nickName: String
    var avatar: String
    var status: String
    var login: String
    var password: String
    var isLogined: Bool
    var friends: [NDUserModel]
    var favoritePosts: [NDPostModel]
    var detailedInfo: NDDetailedUserInfo
    
}
