//
//  NDProfileTableHeaderView.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 11.02.2023.
//

import UIKit

class NDProfileTableHeaderView: UITableViewHeaderFooterView {

    static let headeridentifier = "NDProfileTableHeaderView"
    
    lazy var headerView: NDProfileHeaderView = {
        let view = NDProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(headerView)
        setupConstraint()
        headerView.collectionView.delegate = self
        headerView.collectionView.dataSource = self
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

extension NDProfileTableHeaderView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 7
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NDProfileHeaderViewCollectionViewCell.cellIdentifier, for: indexPath) as? NDProfileHeaderViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
//        cell.configure(with: photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 60)/4
        return CGSize(width: width, height: width)
    }
}
