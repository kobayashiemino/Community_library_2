//
//  LetterViewController.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/10/11.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class LetterViewController: UIViewController {
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.register(LetterViewCell.self, forCellReuseIdentifier: LetterViewCell.identifier)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Thanks Letters"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
}

extension LetterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LetterViewCell.identifier, for: indexPath) as! LetterViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
