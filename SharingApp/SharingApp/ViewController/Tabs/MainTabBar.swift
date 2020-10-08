//
//  ViewController.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/08.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Featured"
        
        let homeViewController = templeteViews(selectedImage: UIImage(systemName: "house.fill")!,
                                                   normalImage: UIImage(systemName: "house")!,
                                                   viewController: HomeViewController())

        let serchViewController = templeteViews(selectedImage: UIImage(systemName: "magnifyingglass")!,
                                                normalImage: UIImage(systemName: "magnifyingglass")!,
                                                viewController: SearchViewController())
        
        let featuredViewController = templeteViews(selectedImage: UIImage(systemName: "star.fill")!,
                                                   normalImage: UIImage(systemName: "star")!,
                                                   viewController: FeaturedViewController())
        
        let favoriteViewController = templeteViews(selectedImage: UIImage(systemName: "heart.fill")!,
                                                   normalImage: UIImage(systemName: "heart")!,
                                                   viewController: FavoriteViewController())
        
        let myPageViewController = templeteViews(selectedImage: UIImage(systemName: "person.fill")!,
                                                 normalImage: UIImage(systemName: "person")!,
                                                 viewController: MyPageViewController())
    
        self.viewControllers = [homeViewController,
                                serchViewController,
                                featuredViewController,
                                favoriteViewController,
                                myPageViewController]
        
        UITabBar.appearance().tintColor = .gray
    }
    
    func templeteViews(selectedImage: UIImage, normalImage: UIImage, viewController: UIViewController) -> UINavigationController {
        let vc = viewController
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.image = normalImage
        navVC.tabBarItem.selectedImage = selectedImage
        return navVC
    }
}

class FavoriteViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "favorite"
    }
}

class FeaturedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "featured"
    }
}
