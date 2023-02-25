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

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGreen
        addSubviews(tableView)
        setupConstraints()
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        viewModel.delegate = self
        viewModel.fetchPosts()
    }

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



