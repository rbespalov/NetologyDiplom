//
//  NDUserModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation
import UIKit

enum Gender: String, Codable {
    case male, feemale
}

struct NDUserModel: Codable {
    
    var loginEmail: String
    var nickName: String
    var avatar: Image
    var status: String
    
    var firstName: String?
    var secondName: String?
    var birthDate: String?
    var gender: Gender?
    var homeTown: String?
    
    var postsID: [String]
    var favoritePostsID: [String]
    
//    var isLogined: Bool?
    
    init(
        loginEmail: String,
        nickName: String,
        avatar: Image = Image(withImage: UIImage(named: "user")!), // обезопасить
        status: String = "Choose your status",
        firstName: String? = nil,
        secondName: String? = nil,
        birthDate: String? = nil,
        gender: Gender? = nil,
        homeTown: String? = nil,
        postsID: [String] = [],
        favoritePostsID: [String] = []
    ) {
        self.loginEmail = loginEmail
        self.nickName = nickName
        self.avatar = avatar
        self.status = status
        self.firstName = firstName
        self.secondName = secondName
        self.birthDate = birthDate
        self.gender = gender
        self.homeTown = homeTown
        self.postsID = postsID
        self.favoritePostsID = favoritePostsID
    }
}
