//
//  ViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDFeedViewController: UIViewController {
    
    private var feedView: NDFeedView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! NDFeedView)
    }
    
    override func loadView() {
        super.loadView()
        
        let feedView = NDFeedView()
        feedView.configure()
        
        view = feedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        stupNavigationBar()
        
        feedView.tableView.dataSource = self
        feedView.tableView.delegate = self
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
    }

}

extension NDFeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NDPostTableViewCell.cellIdentifier, for: indexPath) as? NDPostTableViewCell else {
            fatalError("Cell unsupported")
        }
//        cell.configure(with: posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            
            guard let tableHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: NDFeedTableHeaderView.headeridentifier) as? NDFeedTableHeaderView else {
                fatalError("could not dequeueReusableHeadr")
            }
            return tableHeader
        } else {
            let emptyView = UIView()
            return emptyView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 150
        } else {
            return 0
        }
    }
}
