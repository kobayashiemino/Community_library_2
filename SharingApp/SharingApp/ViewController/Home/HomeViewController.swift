//
//  ViewController.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/09/03.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit
import SideMenu
import ViewAnimator
import Firebase
import SDWebImage
import CCZoomTransition

class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
//    private let categoryTitles:[String] = ["チュートリアル", "貸し出し", "感謝祭"]
    private let categoryTitles:[String] = ["Tutorials", "Lending", "Give Away"]
    
//    private let items: [[Item]] = [[Item(image: UIImage(named: "soccer")!,
//                                         sponcer: "城山サッカー協会",
//                                         sponcerIcon: UIImage(named: "soccer_sponcer")!,
//                                         title: "ドリブルレッスン"),
//                                    Item(image: UIImage(named: "drawing")!,
//                                         sponcer: "城山美術館",
//                                         sponcerIcon: UIImage(named: "drawing_sponcer")!,
//                                         title: "かわいい動物を描いてみよう！"),
//                                    Item(image: UIImage(named: "sewing")!,
//                                         sponcer: "株式会社ヤザワヤ",
//                                         sponcerIcon: UIImage(named: "sewing_sponcer")!,
//                                         title: "雑巾の縫い方")],
//                                   [Item(image: UIImage(named: "shogi")!,
//                                         sponcer: "将棋協会",
//                                         sponcerIcon: UIImage(named: "shogi_sponcer")!,
//                                         title: "将棋セット"),
//                                    Item(image: UIImage(named: "book")!,
//                                         sponcer: "照国書店",
//                                         sponcerIcon: UIImage(named: "book_sponcer")!,
//                                         title: "アヒルの冒険"),
//                                    Item(image: UIImage(named: "ipad")!,
//                                         sponcer: "green apple",
//                                         sponcerIcon: UIImage(named: "ipad_sponcer")!,
//                                         title: "iPad")],
//                                   [Item(image: UIImage(named: "snack")!,
//                                         sponcer: "株式会社アミューズメント",
//                                         sponcerIcon: UIImage(named: "snack_sponcer")!,
//                                         title: "お菓子の詰め合わせ"),
//                                    Item(image: UIImage(named: "alchole")!,
//                                         sponcer: "城山製薬",
//                                         sponcerIcon: UIImage(named: "alchole_sponcer")!,
//                                         title: "消毒液"),
//                                    Item(image: UIImage(named: "ticket")!,
//                                         sponcer: "国立サーカス団",
//                                         sponcerIcon: UIImage(named: "ticket_sponcer")!,
//                                         title: "サーカス鑑賞チケット")]]
    private let items: [[Item]] = [[Item(image: UIImage(named: "soccer")!,
                                         sponcer: "Shiroyama Soccer Association",
                                         sponcerIcon: UIImage(named: "soccer_sponcer")!,
                                         title: "Dribbling & Skills that will blow your mind!"),
                                    Item(image: UIImage(named: "drawing")!,
                                         sponcer: "Tokyo Art Museum",
                                         sponcerIcon: UIImage(named: "drawing_sponcer")!,
                                         title: "Very Easy! How to Draw Cute Cartoon Animals"),
                                    Item(image: UIImage(named: "sewing")!,
                                         sponcer: "Handicraft Inc.",
                                         sponcerIcon: UIImage(named: "sewing_sponcer")!,
                                         title: "Sewing Projects To Make In Under 10 Minutes")],
                                   [Item(image: UIImage(named: "shogi")!,
                                         sponcer: "Japanese Chess Organaization",
                                         sponcerIcon: UIImage(named: "shogi_sponcer")!,
                                         title: "Japanese Chess Board and Pieces"),
                                    Item(image: UIImage(named: "book")!,
                                         sponcer: "bookStore",
                                         sponcerIcon: UIImage(named: "book_sponcer")!,
                                         title: "The Adoventure of Little Duck"),
                                    Item(image: UIImage(named: "ipad")!,
                                         sponcer: "green apple",
                                         sponcerIcon: UIImage(named: "ipad_sponcer")!,
                                         title: "iPad")],
                                   [Item(image: UIImage(named: "snack")!,
                                         sponcer: "amusement arcade Inc",
                                         sponcerIcon: UIImage(named: "snack_sponcer")!,
                                         title: "Snack Variety Pack"),
                                    Item(image: UIImage(named: "alchole")!,
                                         sponcer: "drug store",
                                         sponcerIcon: UIImage(named: "alchole_sponcer")!,
                                         title: "Hand Sanitizer"),
                                    Item(image: UIImage(named: "ticket")!,
                                         sponcer: "Circus troupe",
                                         sponcerIcon: UIImage(named: "ticket_sponcer")!,
                                         title: "tickets for the Circus")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.title = "home"
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.width, height: 270)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if let collectionView = collectionView {
            view.addSubview(collectionView)
            collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .lightGray
            collectionView.showsVerticalScrollIndicator = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        cell.configure(title: categoryTitles[indexPath.row],
                       items: items[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: HomeCellDelegate {
    func didTapCell() {
        let vc = ProductDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
