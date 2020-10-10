//
//  SponcerSDGsView.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/09.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class SponcerSDGsView: UIView {
    
    private var collectionView: UICollectionView?
    
    private var SDGsImages: [UIImage] = [UIImage(named: "SDGs3")!,
                                         UIImage(named: "SDGs4")!,
                                         UIImage(named: "SDGs5")!,
                                         UIImage(named: "SDGs8")!,
                                         UIImage(named: "SDGs9")!,
                                         UIImage(named: "SDGs10")!,
                                         UIImage(named: "SDGs11")!,
                                         UIImage(named: "SDGs17")!]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if let collectionView = collectionView {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(SponcerSDGsCell.self, forCellWithReuseIdentifier: SponcerSDGsCell.identifier)
            collectionView.backgroundColor = .white
            collectionView.showsHorizontalScrollIndicator = false
            addSubview(collectionView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView?.frame = bounds
    }
}

extension SponcerSDGsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SponcerSDGsCell.identifier, for: indexPath) as! SponcerSDGsCell
        cell.setupImage(image: SDGsImages[indexPath.row])
        return cell
    }
}
