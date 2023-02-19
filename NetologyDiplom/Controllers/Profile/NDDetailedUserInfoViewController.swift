//
//  NDDetailedUserInfoViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 19.02.2023.
//

import UIKit

class NDDetailedUserInfoViewController: UIViewController {
    
    private var detailedView = NDDetailedInfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailedView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            detailedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailedView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailedView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
