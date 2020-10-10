//
//  ProductDetailViewController.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/09/06.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SafariServices
import ViewAnimator
import SDWebImage

class ProductDetailViewController: UIViewController {
    
    private var post: Post?
    
    private var images: [UIImage] = [UIImage(named: "related1")!,
                                     UIImage(named: "related2")!,
                                     UIImage(named: "related3")!,
                                     UIImage(named: "related4")!,
                                     UIImage(named: "related5")!]
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let backTopreviousViewButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowColor = UIColor.black.cgColor
        return button
    }()
    
    private let rankImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "rosette")
        image.tintColor = .lightGray
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TITLE"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "MESSAGEMESSAGEMESSAGEMESSAGEMESSAGEMESSAGE"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let providedLabel: UILabel = {
        let label = UILabel()
        label.text = "provided by : "
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "soccer_sponcer")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let sponcerLabel: UIButton = {
        let label = UIButton()
        label.titleLabel?.numberOfLines = 0
        label.titleLabel?.font = .boldSystemFont(ofSize: 14)
        label.titleLabel?.textColor = .darkGray
        label.titleLabel?.textAlignment = .left
        label.setTitleColor(.darkGray, for: .normal)
        return label
    }()
    
    private var collectionView: UICollectionView?
    
    private let relatedLabel: UILabel = {
        let label = UILabel()
        label.text = "related video"
        label.font = .boldSystemFont(ofSize: 19)
        label.textColor = .gray
        return label
    }()
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
        
        guard let imageURL = URL(string: post.imageURL) else { return }
        itemImageView.sd_setImage(with: imageURL, completed: nil)
        
        titleLabel.text = post.title
        captionLabel.text = post.caption
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        itemImageView.image = UIImage(named: "soccer")!
        titleLabel.text = "Dribbling & Skills that will blow your mind!"
        captionLabel.text = "Today we are learning how to dribble. This Dribble video will teach you a different style of Dribbling but based on the same idea, slow to fast. "
        sponcerLabel.setTitle("Shiroyama Soccer Association", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBarController?.navigationController?.isNavigationBarHidden = true
        addSubViews()
    }
    
    private func addSubViews() {
        view.addSubview(itemImageView)
        itemImageView.addSubview(backTopreviousViewButton)
//        view.addSubview(rankImageView)
        view.addSubview(titleLabel)
        view.addSubview(captionLabel)
        view.addSubview(providedLabel)
        view.addSubview(iconImageView)
        view.addSubview(sponcerLabel)
        sponcerLabel.addTarget(self, action: #selector(didTapSponcerLabel), for: .touchUpInside)
        
        backTopreviousViewButton.addTarget(self, action: #selector(didTapBackTopreviousViewButton), for: .touchUpInside)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if let collectionView = collectionView {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
            collectionView.backgroundColor = .init(white: 0.9, alpha: 0.5)
            collectionView.showsHorizontalScrollIndicator = false
            view.addSubview(collectionView)
            collectionView.addSubview(relatedLabel)
        }
    }
    
    override func viewDidLayoutSubviews() {
        itemImageView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.width - 70)
        backTopreviousViewButton.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        providedLabel.frame = CGRect(x: 10, y: itemImageView.bottom + 5, width: 90, height: 30)
        iconImageView.frame = CGRect(x: providedLabel.right, y: itemImageView.bottom + 5, width: 20, height: 20)
        iconImageView.layer.cornerRadius = iconImageView.width / 2
        iconImageView.center.y = providedLabel.center.y
        sponcerLabel.frame = CGRect(x: iconImageView.right, y: itemImageView.bottom + 5, width: 220, height: 30)
        titleLabel.frame = CGRect(x: 10,
                                  y: iconImageView.bottom + 5,
                                  width: view.width - 20,
                                  height: 42)
        //        rankImageView.frame = CGRect(x: titleLabel.right + 20,
        //                                     y: itemImageView.bottom + 10,
        //                                     width: 52, height: 52)
        //        rankImageView.layer.cornerRadius = rankImageView.width / 2
        captionLabel.frame = CGRect(x: 10,
                                    y: titleLabel.bottom,
                                    width: view.width - 20,
                                    height: 70)
        collectionView?.frame = CGRect(x: 0,
                                       y: captionLabel.bottom + 10,
                                       width: view.width,
                                       height: view.height - captionLabel.bottom - 50)
        relatedLabel.frame = CGRect(x: 10, y: 5, width: view.width, height: 30)
    }
    
    @objc private func didTapBackTopreviousViewButton() {
        tabBarController?.navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: true)
        //        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSponcerLabel() {
        let vc = SponcerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        cell.relatedImageView.image = images[indexPath.row]
        return cell
    }
}
