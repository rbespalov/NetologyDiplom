//
//  ViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDFeedViewController: UIViewController {
    
    public var currenUser: NDUserModel
    

    init(currenUser: NDUserModel) {
        self.currenUser = currenUser
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
        let  feedView = NDFeedView(currentUser: currenUser)
        view.addSubview(feedView)
        NSLayoutConstraint.activate([
            feedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            feedView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    private func stupNavigationBar() {
        let leftLabel: UILabel = {
            let leftLabel = UILabel()
            leftLabel.text = "Главная"
            leftLabel.sizeToFit()
           return leftLabel
        }()
        
        let firstRightIcon: UIImageView = {
           let icon = UIImageView(image: UIImage(systemName: "bell"))
            return icon
        }()
        
        let secondRightIcon: UIImageView = {
           let icon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
            return icon
        }()
        
        let leftItem = UIBarButtonItem(customView: leftLabel)
        let firstRightItem = UIBarButtonItem(customView: firstRightIcon)
        let secondRightItem = UIBarButtonItem(customView: secondRightIcon)

        navigationItem.leftBarButtonItem = leftItem
        
        navigationItem.rightBarButtonItems = [firstRightItem, secondRightItem]
        
//        let rightItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addPost))
//        navigationItem.rightBarButtonItems = [rightItem]
    }

//    @objc private func addPost() {
//        print("works")
//    }

}

