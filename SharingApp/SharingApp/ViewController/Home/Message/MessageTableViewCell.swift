//
//  MessageTableViewCell.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/04.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    static let identifier = "MessageTableViewCell"
    
    private let revenueLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "コミュニティ資産合計"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    private let revenueLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "¥100000000"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    private let topicLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "TOPIC"
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "detaildetaildetaildetaildetaildetaildetaildetaildetaildetaildetaildetaildetail"
        return label
    }()
    
    private let cheerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "flag"), for: .normal)
        button.tintColor = .lightGray
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let agreeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "sparkles"), for: .normal)
        button.tintColor = .lightGray
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(revenueLabel1)
        addSubview(revenueLabel2)
        addSubview(topicLabel)
        addSubview(detailLabel)
        addSubview(cheerButton)
        addSubview(agreeButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        revenueLabel1.frame = CGRect(x: 0, y: 10, width: width, height: 40)
        revenueLabel2.frame = CGRect(x: 0, y: revenueLabel1.bottom, width: width, height: 40)
        topicLabel.frame = CGRect(x: 10, y: 10, width: width - 140, height: 40)
        detailLabel.frame = CGRect(x: 10, y: topicLabel.bottom, width: width - 140, height: 40)
        agreeButton.frame = CGRect(x: width - 120, y: 25, width: 50, height: 50)
        cheerButton.frame = CGRect(x: width - 60, y: 25, width: 50, height: 50)
    }
    
    public func setupfirstRow() {
        detailLabel.isHidden = true
        agreeButton.isHidden = true
        cheerButton.isHidden = true
        topicLabel.isHidden = true
        revenueLabel1.isHidden = false
        revenueLabel2.isHidden = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
