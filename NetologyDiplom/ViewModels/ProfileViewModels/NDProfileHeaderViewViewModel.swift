//
//  NDProfileHeaderViewViewModel.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import Foundation
import UIKit

final class NDProfileHeaderViewViewModel: NSObject {
    
    private var photos: [NDProfileHeaderViewCollectionViewCellViewModel] = [
        NDProfileHeaderViewCollectionViewCellViewModel(photoImage: "user"),
        NDProfileHeaderViewCollectionViewCellViewModel(photoImage: "rick"),
        NDProfileHeaderViewCollectionViewCellViewModel(photoImage: "user"),
        NDProfileHeaderViewCollectionViewCellViewModel(photoImage: "rick"),
        NDProfileHeaderViewCollectionViewCellViewModel(photoImage: "user"),
        NDProfileHeaderViewCollectionViewCellViewModel(photoImage: "rick"),
        NDProfileHeaderViewCollectionViewCellViewModel(photoImage: "user"),
    ]
    
}

extension NDProfileHeaderViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NDProfileHeaderViewCollectionViewCell.cellIdentifier, for: indexPath) as? NDProfileHeaderViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 60)/4
        return CGSize(width: width, height: width)
    }
}
