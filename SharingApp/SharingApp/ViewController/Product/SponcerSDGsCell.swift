//
//  SponcerSDGsCell.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/09.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class SponcerSDGsCell: UICollectionViewCell {
    
    static let identifier = "SponcerSDGsCell"
    
    public let SDGsImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(SDGsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        SDGsImageView.frame = bounds
//        SDGsImageView.layer.cornerRadius = SDGsImageView.width / 2
    }
    
    public func setupImage(image: UIImage) {
        SDGsImageView.image = image
    }
}
