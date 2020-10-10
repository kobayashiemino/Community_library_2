//
//  SponcerViewController.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/09.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit
import WCLShineButton

class SponcerViewController: UIViewController {
    
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
    
    private lazy var favoriteButton: WCLShineButton = {
        var params = WCLShineParams()
        params.bigShineColor = .systemPink
        params.smallShineColor = .systemPink
        let button = WCLShineButton(frame: .init(x: view.width - 62, y: 10, width: 42, height: 42),
                                    params: params)
        button.image = .defaultAndSelect(UIImage(named: "heart")!, UIImage(named: "heart_selected")!)
        return button
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
    
    private var collectionView: UICollectionView?
    
    private let relatedLabel: UILabel = {
        let label = UILabel()
        label.text = "related video"
        label.font = .boldSystemFont(ofSize: 19)
        label.textColor = .gray
        return label
    }()
    
    private let sponcerSDGsView = SponcerSDGsView()
    
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
        itemImageView.image = UIImage(named: "soccer_sponcer")!
        titleLabel.text = "Shiroyama Soccer Association"
        captionLabel.text = "Based on its social responsibility as the organization that controls soccer competitions, the Shiroyama Football Association (SFA) creates a rich sports culture through soccer, and promotes the healthy development of people's mind and body and the development of society. Based on the philosophy of 'contributing,' we are engaged in various social contribution activities through soccer."
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
        view.addSubview(sponcerSDGsView)
        view.addSubview(favoriteButton)
        
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
        itemImageView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.width - 180)
//        favoriteButton.frame = CGRect(x: view.width - 62, y: 10, width: 52, height: 52)
        favoriteButton.center.y = itemImageView.bottom + 10
        backTopreviousViewButton.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        titleLabel.frame = CGRect(x: 10,
                                  y: itemImageView.bottom + 10,
                                  width: view.width - 20,
                                  height: 32)
        //        rankImageView.frame = CGRect(x: titleLabel.right + 20,
        //                                     y: itemImageView.bottom + 10,
        //                                     width: 52, height: 52)
        //        rankImageView.layer.cornerRadius = rankImageView.width / 2
        captionLabel.frame = CGRect(x: 10,
                                    y: titleLabel.bottom,
                                    width: view.width - 20,
                                    height: 145)
        sponcerSDGsView.frame = CGRect(x: 0, y: captionLabel.bottom, width: view.width, height: 70)
        collectionView?.frame = CGRect(x: 0,
                                       y: sponcerSDGsView.bottom,
                                       width: view.width,
                                       height: view.height - captionLabel.bottom - 110)
        relatedLabel.frame = CGRect(x: 10, y: 5, width: view.width, height: 30)
    }
    
    @objc private func didTapBackTopreviousViewButton() {
        tabBarController?.navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: true)
        //        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension SponcerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        cell.relatedImageView.image = images[indexPath.row]
        return cell
    }
}
