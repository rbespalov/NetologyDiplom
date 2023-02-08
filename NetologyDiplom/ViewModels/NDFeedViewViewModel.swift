//
//  NDFeedViewViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 06.02.2023.
//

import Foundation
import UIKit

final class NDFeedViewViewModel: NSObject {
    
    public var posts: [NDPostTableViewCellViewModel] = [
        NDPostTableViewCellViewModel(authorName: "1", authorAvatar: "1", authorStatus: "z", postText: "1", postImage: "1", numberOfLikes: 1, numberOfComments: 1, postDate: .now
        ),
        NDPostTableViewCellViewModel(authorName: "2", authorAvatar: "2", authorStatus: "2", postText: "2", postImage: "2", numberOfLikes: 2, numberOfComments: 2, postDate: .now
        ),
        NDPostTableViewCellViewModel(authorName: "3", authorAvatar: "3", authorStatus: "3", postText: "3", postImage: "3", numberOfLikes: 3, numberOfComments: 3, postDate: .now
        ),
    ]
    
}

extension NDFeedViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NDPostTableViewCell.cellIdentifier, for: indexPath) as? NDPostTableViewCell else {
            fatalError("Cell unsupported")
        }
        cell.configure(with: posts[indexPath.row])
        
        return cell
    }
    
    
}
