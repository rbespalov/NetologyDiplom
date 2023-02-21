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
}

final class NDProfileViewViewModel: NSObject {
    
    public weak var delegate: NDProfileViewViewModelDelegate?
    
    public var posts: [NDPostTableViewCellViewModel] = [
        NDPostTableViewCellViewModel(authorName: "Adolf Linkler", authorAvatar: "user", authorStatus: "Galaktus", postText: "On June 11, 2021, the band returned with a new song titled To the Hellfire, and announced Ramos as their new permanent vocalist. They also announced details of their new EP; ...And I Return to Nothingness.[20] It is the band’s first EP since their breakthrough 2013 release Maleficium.", postImage: "rick", numberOfLikes: 13332, numberOfComments: 1231, postDate: .now
        ),
        NDPostTableViewCellViewModel(authorName: "Pako Sanchez", authorAvatar: "user", authorStatus: "El barto", postText: "On June 11, 2021, the band returned with a new song titled To the Hellfire, and announced Ramos as their new permanent vocalist. They also announced details of their new EP; ...And I Return to Nothingness.[20] It is the band’s first EP since their breakthrough 2013 release Maleficium.", postImage: "rick", numberOfLikes: 4342, numberOfComments: 223, postDate: .now
        ),
        NDPostTableViewCellViewModel(authorName: "Morty Smith", authorAvatar: "user", authorStatus: "Okaaaay", postText: "On June 11, 2021, the band returned with a new song titled To the Hellfire, and announced Ramos as their new permanent vocalist. They also announced details of their new EP; ...And I Return to Nothingness.[20] It is the band’s first EP since their breakthrough 2013 release Maleficium.", postImage: "rick", numberOfLikes: 343, numberOfComments: 363, postDate: .now
        ),
    ]
    
}

extension NDProfileViewViewModel: UITableViewDataSource, UITableViewDelegate {
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
    func didTapDetailUserInfo() {
        delegate?.didTapDetailUserInfo()
    }
}
