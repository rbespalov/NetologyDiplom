//
//  NDProfileTableHeaderView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import UIKit

class NDProfileTableHeaderView: UITableViewHeaderFooterView {

    static let headeridentifier = "NDProfileTableHeaderView"
    
    private var headerView: NDProfileHeaderView = {
        let view = NDProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(headerView)
        setupConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            headerView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),

        ])
    }

}
