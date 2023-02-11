//
//  NDFeedHeadViewCollectionViewCellViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import Foundation
import UIKit

final class NDFeedHeadViewCollectionViewViewModel: NSObject {
    
    private var avatars: [NDFeedHeadViewCollectionViewCellViewModel] = [
        NDFeedHeadViewCollectionViewCellViewModel(friendAvatar: "user"),
        NDFeedHeadViewCollectionViewCellViewModel(friendAvatar: "rick"),
        NDFeedHeadViewCollectionViewCellViewModel(friendAvatar: "user"),
        NDFeedHeadViewCollectionViewCellViewModel(friendAvatar: "rick"),
        NDFeedHeadViewCollectionViewCellViewModel(friendAvatar: "user"),
        NDFeedHeadViewCollectionViewCellViewModel(friendAvatar: "rick"),
        NDFeedHeadViewCollectionViewCellViewModel(friendAvatar: "user"),

    ]
    
}

extension NDFeedHeadViewCollectionViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NDFeedHeadViewCollectionViewCell.cellIdentifier, for: indexPath) as? NDFeedHeadViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: avatars[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let bounds = UIScreen.main.bounds
        let width = (bounds.width-60)/5
        return CGSize(width: width, height: width)
//        return CGSize(width: 50, height: 50)
    }
    
    
}
