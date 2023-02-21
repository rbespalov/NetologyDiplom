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
    
}

extension NDNewPostViewViewModel: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {return}
        delegate?.imagePicked(image: image)
        picker.dismiss(animated: true)
    }
    
}

extension NDNewPostViewViewModel: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print(textView.text)
    }
    
}
