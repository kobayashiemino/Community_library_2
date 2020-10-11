//
//  CategoryHeaderView.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/11.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit
import PinterestSegment

class CategoryHeaderView: UIView {
    
    private let segmentControl: PinterestSegment = {
        var style = PinterestSegmentStyle()
        style.indicatorColor = .lightGray
        style.titlePendingHorizontal = 14
        style.titlePendingVertical = 14
        style.titleMargin = 0
        style.normalTitleColor = .lightGray
        style.selectedTitleColor = .white
        style.titleFont = UIFont.systemFont(ofSize: 16)
        let segmentControl = PinterestSegment(frame: .zero,
                                              segmentStyle: style,
                                              titles: ["featured",
                                                       "talk",
                                                       "article",
                                                       "sponsor",
                                                       "post",
                                                       "members",
                                                       "Tutorial",
                                                       "lending",
                                                       "give away"])
        segmentControl.backgroundColor = .white
        return segmentControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(segmentControl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        segmentControl.frame = bounds
    }
}
