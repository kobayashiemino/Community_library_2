//
//  SideMenuTableViewCell.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/09/04.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit
import SDWebImage

struct Item {
    let image: UIImage
    let sponcer: String
    let sponcerIcon: UIImage
    let title: String
}

protocol HomeCellDelegate: AnyObject {
    func didTapCell()
}

class HomeCell: UICollectionViewCell {
    
    static let identifier = "HomeCell"
    
    public var delegate: HomeCellDelegate?
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var moreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "more "))
        attributedString.append(setImageInLabel(image: UIImage(systemName: "chevron.right")!.withTintColor(.darkGray)))
        label.attributedText = attributedString
        label.textColor = .darkGray
        return label
    }()
    
    private var items = [Item]()
    
    private var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if let collectionView = collectionView {
            addSubview(collectionView)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: HomeItemCell.identifier)
            collectionView.backgroundColor = .white
            collectionView.showsHorizontalScrollIndicator = false
        }
        addSubview(categoryLabel)
        addSubview(moreLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let moreLabelWidth: CGFloat = 100
        categoryLabel.frame = CGRect(x: 10, y: 0, width: width, height: 50)
        collectionView?.frame = CGRect(x: 0, y: categoryLabel.bottom, width: width, height: height - 90)
        moreLabel.frame = CGRect(x: width - moreLabelWidth - 10, y: collectionView!.bottom, width: moreLabelWidth, height: 25)
    }
    
    public func configure(title: String, items:[Item]) {
        categoryLabel.text = title
        self.items = items
    }
    
    private func setImageInLabel(image: UIImage) -> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        return NSAttributedString(attachment: attachment)
    }
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.identifier, for: indexPath) as! HomeItemCell
        cell.configure(item: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapCell()
    }
}
