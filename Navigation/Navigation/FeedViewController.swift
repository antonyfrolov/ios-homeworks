//
//  NavCon1.swift
//  Navigation
//
//  Created by antonfrolov on 05.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
        
        let buttonPost = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        buttonPost.setTitle("Пост", for: .normal)
        buttonPost.backgroundColor = .black
        buttonPost.center = view.center
        buttonPost.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        view.addSubview(buttonPost)
    }
    
    @objc private func tapAction() {
        let vc = PostViewController()
        present(vc, animated: true)
    }
    
}
