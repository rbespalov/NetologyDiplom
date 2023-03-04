//
//  NDProfileView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

protocol NDProfileViewDelegate: AnyObject {
    func didTapDetailUserInfo()
    func createPost()
}

final class NDProfileView: UIView {
    
    public var currentUser: NDUserModel
    
    private let viewModel = NDProfileViewViewModel()
    
    public weak var delegate: NDProfileViewDelegate?
        
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NDPostTableViewCell.self, forCellReuseIdentifier: NDPostTableViewCell.cellIdentifier)
        tableView.register(NDProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: NDProfileTableHeaderView.headeridentifier)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
//    required init(currentUser: NDUserModel) {
//        self.currentUser = currentUser
//        super.init(frame: UIScreen.main.bounds)
//        let viewModel = NDProfileViewViewModel()
//        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .systemGreen
//        addSubviews(tableView)
//        setupConstraints()
//        tableView.delegate = viewModel
//        tableView.dataSource = viewModel
//        viewModel.delegate = self
//        print(currentUser)
//    }

    init(frame: CGRect, currentUser: NDUserModel) {
        self.currentUser = currentUser
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGreen
        addSubviews(tableView)
        setupConstraints()
//        let viewModel = NDProfileViewViewModel()
        viewModel.currentUser = currentUser
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        viewModel.delegate = self
    }
    
//    convenience init(frame: CGRect, currentUser: NDUserModel) {
//        self.init(frame: frame)
//        self.currentUser = currentUser
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

extension NDProfileView: NDProfileViewViewModelDelegate {
    
    func createPost() {
        delegate?.createPost()
//        viewModel.posts = NDUserManager.shared.currentUser.posts
//        viewModel.fetchPosts()
    }
    
    func didTapDetailUserInfo() {
        delegate?.didTapDetailUserInfo()
    }
}



