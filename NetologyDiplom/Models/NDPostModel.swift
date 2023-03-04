//
//  NDPostModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation
import UIKit

struct Image: Codable{
    let imageData: Data?
    
    init(withImage image: UIImage) {
        self.imageData = image.pngData()
    }
    func getImage() -> UIImage? {
        guard let imageData = self.imageData else {
            return nil
        }
        let image = UIImage(data: imageData)
        
        return image
    }
}

public struct NDPostModel: Codable {
    let id: String
    let authorName: String
    let authorAvatar: Image
    let authorStatus: String
    let postText: String
    let postImage: Image
    let numberOfLikes: Int
    let numberOfComments: Int
    let postDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case authorName
        case authorAvatar
        case authorStatus
        case postText
        case postImage
        case numberOfLikes
        case numberOfComments
        case postDate
    }
    
    init(
        id: String = UUID().uuidString,
        authorName: String,
        authorAvatar: Image,
        authorStatus: String,
        postText: String,
        postImage: Image,
        numberOfLikes: Int = Int.random(in: 1...1000),
        numberOfComments: Int = Int.random(in: 1...1000),
        postDate: Date = .now
    ) {
        self.id = id
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

