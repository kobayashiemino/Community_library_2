//
//  ViewController.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/08.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Featured"
        
        let homeViewController = templeteViews(selectedImage: UIImage(systemName: "house.fill")!,
                                                   normalImage: UIImage(systemName: "house")!,
                                                   viewController: HomeViewController(),
                                                   title: "home")

        let serchViewController = templeteViews(selectedImage: UIImage(systemName: "magnifyingglass")!,
                                                normalImage: UIImage(systemName: "magnifyingglass")!,
                                                viewController: SearchViewController(),
                                                title: "search")
        
        let featuredViewController = templeteViews(selectedImage: UIImage(systemName: "star.fill")!,
                                                   normalImage: UIImage(systemName: "star")!,
                                                   viewController: HomeViewController(),
                                                   title: "featured")
        
        let favoriteViewController = templeteViews(selectedImage: UIImage(systemName: "heart.fill")!,
                                                   normalImage: UIImage(systemName: "heart")!,
                                                   viewController: FavoriteViewController(),
                                                   title: "favorite")
        
        let myPageViewController = templeteViews(selectedImage: UIImage(systemName: "person.fill")!,
                                                 normalImage: UIImage(systemName: "person")!,
                                                 viewController: MyPageViewController(),
                                                 title: "my page")
    
        self.viewControllers = [homeViewController,
                                serchViewController,
                                featuredViewController,
                                favoriteViewController,
                                myPageViewController]
        
        UITabBar.appearance().tintColor = .gray
    }
    
    func templeteViews(selectedImage: UIImage, normalImage: UIImage, viewController: UIViewController, title: String) -> UINavigationController {
        let vc = viewController
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.image = normalImage
        navVC.tabBarItem.selectedImage = selectedImage
        navVC.tabBarItem.title = title
    
        return navVC
    }
}

class FavoriteViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "favorite"
    }
}

class FeaturedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "featured"
    }
}
