//
//  NDUserModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation

struct NDUserModel {
    var nickName: String
    var login: String
    
    var avatar: URL?
    
    var firstName: String?
    var secondName: String?
    var birthDate: String?
    var gender: String?
    var homeTown: String?
    
    var posts: [NDPostModel]
    
    var status: String
//    var password: String?
    var isLogined: Bool?
//    var friends: [NDUserModel]?
    var favoritePosts: [NDPostModel]?
    var detailedInfo: NDDetailedUserInfo?
    
}
