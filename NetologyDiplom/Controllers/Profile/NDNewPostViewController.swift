//
//  NDNewPostViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 21.02.2023.
//

import UIKit

class NDNewPostViewController: UIViewController {
    
    private var newPostView = NDNewPostView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newPostView)
        setupConstraints()
        newPostView.delegate = self
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            newPostView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newPostView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newPostView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            newPostView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
}

extension NDNewPostViewController: NDNewPostViewDelegate {
    func showPicker(picker: UIImagePickerController) {
        present(picker, animated: true)
    }
    
    
}
