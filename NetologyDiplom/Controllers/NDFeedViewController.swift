//
//  ViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDFeedViewController: UIViewController {
    
    private let feedView = NDFeedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpView()
        stupNavigationBar()
    }
    
    private func setUpView() {
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
        
        let leftItem = UIBarButtonItem(customView: leftLabel)
        navigationItem.leftBarButtonItem = leftItem
    }


}

