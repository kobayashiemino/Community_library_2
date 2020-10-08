//
//  HomeItemCellCollectionViewCell.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/05.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class HomeItemCell: UICollectionViewCell {
    
    static let identifier = "HomeItemCell"
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        return view
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let titleLabel: UIButton = {
        let label = UIButton()
//        label.textAlignment = .left
        label.titleLabel?.numberOfLines = 2
        label.titleLabel?.textAlignment = .left
        label.titleLabel?.font = .boldSystemFont(ofSize: 15)
        label.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.setTitleColor(.darkGray, for: .normal)
        label.isUserInteractionEnabled = false
        label.backgroundColor = .white
        return label
    }()
    
    private let sponcerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 11)
        label.textColor = .lightGray
        return label
    }()
    
    private let sponcerIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .init(white: 1, alpha: 0.9)
        addSubview(shadowView)
        shadowView.addSubview(imageView)
        shadowView.addSubview(titleLabel)
        shadowView.addSubview(sponcerLabel)
        shadowView.addSubview(sponcerIcon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        imageView.frame = CGRect(x: 0, y: 0, width: shadowView.frame.size.width, height: width - 90)
        titleLabel.frame = CGRect(x: 0, y: imageView.bottom - 5, width: width, height: 55)
        sponcerIcon.frame = CGRect(x: 5, y: 0, width: 30, height: 30)
        sponcerIcon.layer.cornerRadius = sponcerIcon.width / 2
        sponcerLabel.frame = CGRect(x: sponcerIcon.right + 10, y: titleLabel.bottom, width: width - 50, height: 40)
        sponcerIcon.center.y = height - (sponcerLabel.height / 2)
    }
    
    public func configure(item: Item) {
        imageView.image = item.image
        titleLabel.setTitle(item.title, for: .normal)
        sponcerLabel.text = item.sponcer
        sponcerIcon.image = item.sponcerIcon
    }
}
