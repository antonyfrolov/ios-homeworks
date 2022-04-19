//
//  PostViewController.swift
//  Navigation
//
//  Created by antonfrolov on 05.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post = Post(title: "Default post", description: "Default desc", author: "Noname", likes: 0, views: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        navigationItem.title = post.title
        
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapBarItem))
        navigationItem.rightBarButtonItem = barItem
        
    }
    
    @objc private func tapBarItem() {
            let infoViewController = InfoViewController()
            present(infoViewController, animated: true)
        }
}
