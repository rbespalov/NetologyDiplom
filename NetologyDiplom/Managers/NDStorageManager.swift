//
//  NDStorageManager.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 22.02.2023.
//

import Foundation
import UIKit
import FirebaseStorage

// MARK: НЕ БУДЕТ ИСПОЛЬЗОВАТЬСЯ

enum ImageType: String {
    case avatar
    case postImage
}

final class NDStorageManager {
    static let shared = NDStorageManager()
    private init() {}

    public func upload(photo: UIImage, userLogin: String, imageType: ImageType, completion: @escaping (URL) -> Void) {
                
        switch imageType {
        case .avatar:
            let ref = Storage.storage().reference().child("photos")
                .child("\(userLogin)")
                .child("\(imageType)")
            
            guard let image = photo.jpegData(compressionQuality: 0.4) else {return}
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            ref.putData(image, metadata: metadata) { data, error in
                guard let _ = data else {
                    print("error upload")
                    return
                }
                ref.downloadURL { url, error in
                    guard let url = url else {
                        print("error url")
                        return
                    }
                    completion(url)
                }
                
            }
            
        case .postImage:
            let ref = Storage.storage().reference().child("photos")
                .child("\(userLogin)")
                .child("\(imageType)")
                .child("\(UUID().uuidString)")
            
            guard let image = photo.jpegData(compressionQuality: 0.4) else {return}
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            ref.putData(image, metadata: metadata) { data, error in
                guard let _ = data else {
                    print("error upload")
                    return
                }
                ref.downloadURL { url, error in
                    guard let url = url else {
                        print("error url")
                        return
                    }
                    completion(url)
                }
            }
        }
    }
    
    public func ddownloadImage (url: URL) -> UIImage {
        var imageFormURL: UIImage?
        let urlString = url.absoluteString
        let ref = Storage.storage().reference(forURL: urlString)
        let megaByte: Int64 = (1 * 1024 * 1024)
        ref.getData(maxSize: megaByte) { data, error in
            guard let imageData = data else {return}
            imageFormURL = UIImage(data: imageData)!
        }
        return imageFormURL!
    }
}
