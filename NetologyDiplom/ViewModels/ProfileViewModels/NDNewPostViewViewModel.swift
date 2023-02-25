//
//  NDNewPostViewViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 21.02.2023.
//

import Foundation
import UIKit

protocol NDNewPostViewViewModelDelegate: AnyObject {
    func imagePicked(image: UIImage)
}

final class NDNewPostViewViewModel: NSObject {
    
    public weak var delegate: NDNewPostViewViewModelDelegate?
    
    public var postText = ""
    
    public var postImageURL: URL?
    
}

extension NDNewPostViewViewModel: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {return}
        NDStorageManager.shared.upload(
            photo: image,
            userLogin: NDUserManager.shared.currentUser.login,
            imageType: .postImage) { imageURL in
                self.postImageURL = imageURL
            }
        delegate?.imagePicked(image: image)
        picker.dismiss(animated: true)
    }
    
}

extension NDNewPostViewViewModel: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let text = textView.text else { return }
        
        postText = text
    }
    
}
