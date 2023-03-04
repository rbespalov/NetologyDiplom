//
//  NDFeedView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDFeedView: UIView {
    
    private let viewModel = NDFeedViewViewModel()
    
    public var currentUser: NDUserModel
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NDPostTableViewCell.self, forCellReuseIdentifier: NDPostTableViewCell.cellIdentifier)
        tableView.register(NDFeedTableHeaderView.self, forHeaderFooterViewReuseIdentifier: NDFeedTableHeaderView.headeridentifier)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

//    init(currentUser: NDUserModel) {
//        self.currentUser = currentUser
//        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//    }
    
    required init(currentUser: NDUserModel) {
        self.currentUser = currentUser
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGreen
        addSubviews(tableView)
        setupConstraints()
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .systemGreen
//        addSubviews(tableView)
//        setupConstraints()
//        tableView.delegate = viewModel
//        tableView.dataSource = viewModel
//    }
    
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
