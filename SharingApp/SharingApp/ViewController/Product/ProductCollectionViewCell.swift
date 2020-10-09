//
//  ProductCollectionViewCell.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/09.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionViewCell"
    
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
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(shadowView)
        addSubview(relatedImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.frame = bounds
        relatedImageView.frame = bounds
    }
}
