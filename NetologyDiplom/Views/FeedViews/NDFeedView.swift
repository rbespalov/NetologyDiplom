//
//  NDFeedView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDFeedView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NDPostTableViewCell.self, forCellReuseIdentifier: NDPostTableViewCell.cellIdentifier)
        tableView.register(NDFeedTableHeaderView.self, forHeaderFooterViewReuseIdentifier: NDFeedTableHeaderView.headeridentifier)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    func configure() {
        backgroundColor = .systemGreen
        addSubviews(tableView)
        setupConstraints()
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
