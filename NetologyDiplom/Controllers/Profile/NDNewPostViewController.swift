//
//  NDNewPostViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 21.02.2023.
//

import UIKit



class NDNewPostViewController: UIViewController {
    
    private var newPostView: NDNewPostView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! NDNewPostView)
    }
    
    override func loadView() {
        super.loadView()
        
        let newPostView = NDNewPostView()
        newPostView.configure()
        
        view = newPostView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        newPostView.postTextTextField.delegate = self
    }
    
    //add tap pick image
    @objc private func pickImage() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
//        picker.allowsEditing = true
//        let OK = UIBarButtonItem(title: "OK", style: .done, target: nil, action: nil)
//        picker.navigationItem.rightBarButtonItem = OK
        picker.delegate = self
//        delegate?.showPicker(picker: picker)
    }
}


extension NDNewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let image = info[.originalImage] as? UIImage else {return}
//        NDStorageManager.shared.upload(
//            photo: image,
//            userLogin: NDUserManager.shared.currentUser.login,
//            imageType: .postImage) { imageURL in
//                self.postImageURL = imageURL
//            }
//        delegate?.imagePicked(image: image)
        picker.dismiss(animated: true)
    }
    
}

extension NDNewPostViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
//        guard let text = textView.text else { return }
        
//        postText = text
    }
    
}
