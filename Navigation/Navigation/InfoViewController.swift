//
//  InfoViewController.swift
//  Navigation
//
//  Created by antonfrolov on 05.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let buttonAlert = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        buttonAlert.setTitle("Алерт", for: .normal)
        
        buttonAlert.addTarget(self, action: #selector(tapAlertAction), for: .touchUpInside)
        
        view.addSubview(buttonAlert)
    }
    

    @objc private func tapAlertAction() {
        //let postViewController = PostViewController()
        //postViewController.post = Post(title: "Переданный пост")
        //navigationController?.viewControllers.append(postViewController)
    }
}
