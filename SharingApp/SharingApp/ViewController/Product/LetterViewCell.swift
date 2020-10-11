//
//  LetterViewCell.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/11.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit
import ReadMoreTextView

class LetterViewCell: UITableViewCell {
    
    static let identifier = "LetterViewCell"
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
//    private let messageLabel: UILabel = {
//        let label = UILabel()
//        label.text = "messagemessagemessagemessagemessagemessagemessagemessage"
//        label.font = .systemFont(ofSize: 15)
//        label.numberOfLines = 0
//        label.textColor = .darkGray
//        return label
//    }()
    
    private let messageLabel: ReadMoreTextView = {
        let textView = ReadMoreTextView()
        textView.shouldTrim = true
        textView.text = "test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test "
        textView.maximumNumberOfLines = 3
        textView.attributedReadMoreText = NSAttributedString(string: "... Read more")
        textView.attributedReadLessText = NSAttributedString(string: "Read less")
        textView.textContainer.heightTracksTextView = true
        textView.textColor = .darkGray
        textView.font = .systemFont(ofSize: 14)
        return textView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(messageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        iconImageView.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        nameLabel.frame = CGRect(x: iconImageView.right + 10, y: 10, width: width - 80, height: 15)
        messageLabel.frame = CGRect(x: iconImageView.right + 10, y: nameLabel.bottom, width: width - 100, height: 55)
    }
}
