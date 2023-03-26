//
//  NDProfileViewController.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import UIKit

final class NDProfileViewController: UIViewController {
    
    private var profileView: NDProfileView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! NDProfileView)
    }
    
    override func loadView() {
        super.loadView()
        
        let profileView = NDProfileView()
        profileView.configure()
        
        view = profileView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        stupNavigationBar()
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
    }
    
    func stupNavigationBar() {
        
        let leftItem: UILabel = {
            let label = UILabel()
            
            label.text = "ProfileVC"
            
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

extension NDProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NDPostTableViewCell.cellIdentifier, for: indexPath) as? NDPostTableViewCell else {
            fatalError("Cell unsupported")
        }
        //        cell.configure(with: postViewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            
            guard let tableHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: NDProfileTableHeaderView.headeridentifier) as? NDProfileTableHeaderView else {
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
            return 500
        } else {
            return 0
        }
    }
}
