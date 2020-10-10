//
//  SponcerCollectionViewCell.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/10.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class SponcerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SponcerCollectionViewCell"
    
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
    
    public var relatedImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(shadowView)
        addSubview(relatedImageView)
        addSubview(categoryLabel)
        addSubview(titleLabel)
//        addSubview(gradientView)
        
//        setupMask()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.frame = bounds
//        shadowView.layer.cornerRadius = shadowView.width / 2
        relatedImageView.frame = CGRect(x: 0, y: 0, width: width, height: 80)
        relatedImageView.center.x = width / 2
        categoryLabel.frame = CGRect(x: 5, y: relatedImageView.bottom, width: width, height: 25)
        titleLabel.frame = CGRect(x: 5, y: categoryLabel.bottom, width: width, height: 20)
//        gradientView.frame = bounds
    }
    
    public func configure(item: SponcerItem) {
        relatedImageView.image = item.image
        categoryLabel.text = item.category
        titleLabel.text = item.title
    }
    
//    private func setupMask() {
//        let mask = CAGradientLayer()
//        mask.startPoint = CGPoint(x: 0.0, y: 0.0)
//        mask.endPoint = CGPoint(x:0.0, y:1.0)
//        let blackColor = UIColor.black
//        mask.colors = [blackColor.withAlphaComponent(0.0).cgColor,blackColor.withAlphaComponent(0.5),blackColor.withAlphaComponent(1.0).cgColor]
//        mask.locations = [NSNumber(value: 0.0),NSNumber(value: 0.2),NSNumber(value: 1.0)]
//        mask.frame = bounds
//        gradientView.layer.mask = mask
//    }
}
