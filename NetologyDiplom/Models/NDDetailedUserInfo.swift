//
//  NDDetailedUserInfo.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 08.02.2023.
//

import Foundation

enum Gender: String {
    case male, feemale
}

struct NDDetailedUserInfo {
    var fullName: String
    var secondName: String
    var gender: Gender
    var dateOfBirth: Date
    var homeTown: String
}
