//
//  NDProfileViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDProfileViewController: UIViewController {
    
    public let currentUser: NDUserModel
    
//    private let profileView = NDProfileView()

    init(currentUser: NDUserModel) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpView()
        stupNavigationBar()
    }
    
    private func setUpView() {
        let profileView = NDProfileView(frame: .zero, currentUser: currentUser)
        profileView.delegate = self
        view.addSubview(profileView)
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            profileView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    func stupNavigationBar() {
        
        let leftItem: UILabel = {
            let label = UILabel()
            
//            label.text = NDFirestoreDatabase.shared.getData()
            
            return label
        }()
        
        let lefBarItem = UIBarButtonItem(customView: leftItem)
        
        let rightItem: UIImageView = {
            let image = UIImageView(image: UIImage(systemName: "line.3.horizontal"))
            return image
        }()
        
        let rightBarItem = UIBarButtonItem(customView: rightItem)
        navigationItem.rightBarButtonItem = rightBarItem
        navigationItem.leftBarButtonItem = lefBarItem
    }
}

extension NDProfileViewController: NDProfileViewDelegate {
    func createPost() {
        let vc = NDNewPostViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func didTapDetailUserInfo() {
        let vc = NDDetailedUserInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

