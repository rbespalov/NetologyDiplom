//
//  NDFeedHeaderView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import UIKit

class NDFeedTableHeaderView: UITableViewHeaderFooterView {
    
    static let headeridentifier = "NDFeedHeaderView"
    
    lazy var headerView: NDFeedHeaderView = {
        let view = NDFeedHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(headerView)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            headerView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),

        ])
    }
}

extension NDFeedTableHeaderView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NDFeedHeaderViewCollectionViewCell.cellIdentifier, for: indexPath) as? NDFeedHeaderViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
//        cell.configure(with: avatars[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let bounds = UIScreen.main.bounds
        let width = (bounds.width-60)/5
        return CGSize(width: width, height: width)
    }
    
    
}
