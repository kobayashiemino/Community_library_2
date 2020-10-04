//
//  SideMenuTableView.swift
//  SharingApp
//
//  Created by kobayashi emino on 2020/09/03.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

protocol MessageTableViewDelegate: AnyObject {
    func didSelectMenuItem(menuItem: String)
}

class MessageTableViewController: UIViewController {
    
    private var messageItems: [String]
    public weak var delegate: MessageTableViewDelegate?
    
    private let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    init(with menuItems: [String]) {
        self.messageItems = menuItems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapPlusButton))
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc private func didTapPlusButton() {
//        let alert = UIAlertController(title: "new topics",
//                                      message: "tell your story",
//                                      preferredStyle: .alert)
//        alert.addTextField(configurationHandler: nil)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] (_) in
//            guard let `self` = self else { return }
//            guard let topic = alert.textFields?.first?.text else { return }
//            `self`.messageItems.append(topic)
//            `self`.tableView.beginUpdates()
//            `self`.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
//            `self`.tableView.endUpdates()
//        }))
//        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
//        present(alert, animated: true, completion: nil)
        let vc = MessageAddViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension MessageTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageItems.count + 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier, for: indexPath) as! MessageTableViewCell
        if indexPath.row == 0 {
            cell.setupfirstRow()
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc private func didTapCancelButton(_ sender: CustomButton) {
        
        guard let indexPath = sender.indexPath else { return }
        tableView.beginUpdates()
        self.messageItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = MessageDetailViewController()
//        let navVC = UINavigationController(rootViewController: vc)
//        navVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            self.messageItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
