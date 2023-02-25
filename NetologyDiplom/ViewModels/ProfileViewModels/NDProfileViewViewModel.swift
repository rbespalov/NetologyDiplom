//
//  NDProfileViewViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation
import UIKit

protocol NDProfileViewViewModelDelegate: AnyObject {
    func didTapDetailUserInfo()
    func createPost()
    
}

final class NDProfileViewViewModel: NSObject {
    
    public weak var delegate: NDProfileViewViewModelDelegate?
    
    public var posts: [NDPostModel] = [] {
        didSet {
            for post in posts {
                let postViewModel = NDPostTableViewCellViewModel(
                    authorName: post.authorName,
                    authorAvatar: UIImage(named: "logo")!,
                    authorStatus: post.authorStatus,
                    postText: post.postText,
                    postImage: UIImage(named: "rick")!,
                    numberOfLikes: Int(post.numberOfLikes),
                    numberOfComments: Int(post.numberOfComments),
                    postDate: .now)

                if !postViewModels.contains(postViewModel) {
                    postViewModels.append(postViewModel)
                }
            }
        }
    }
    
//    private var posts: [NDPostModel] = NDUserManager.shared.currentUser.posts
    
    private var postViewModels: [NDPostTableViewCellViewModel] = []
    
    public func fetchPosts() {
        NDFirestroreManager.shared.getPostsData { dict in
            for dict in dict {
                let singlePost = NDPostModel(
                    authorName: dict["authorName"] as! String,
                    authorStatus: dict["authorStatus"] as! String,
                    postText: dict["postText"] as! String,
                    postImage: dict["postImage"] as! String
                )
//                self.posts.append(singlePost)
                NDUserManager.shared.currentUser.posts.append(singlePost)
            }
            self.posts = NDUserManager.shared.currentUser.posts
        }
    }
    
}

extension NDProfileViewViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModels.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NDPostTableViewCell.cellIdentifier, for: indexPath) as? NDPostTableViewCell else {
            fatalError("Cell unsupported")
        }
        cell.configure(with: postViewModels[indexPath.row])
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {

            guard let tableHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: NDProfileTableHeaderView.headeridentifier) as? NDProfileTableHeaderView else {
                fatalError("could not dequeueReusableHeadr")
            }
            tableHeader.delegate = self
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

extension NDProfileViewViewModel: NDProfileTableHeaderViewDelegate {
    func createPost() {
        delegate?.createPost()
    }
    
    func didTapDetailUserInfo() {
        delegate?.didTapDetailUserInfo()
    }
}
