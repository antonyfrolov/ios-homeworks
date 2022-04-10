//
//  ProfileViewController.swift
//  Navigation
//
//  Created by antonfrolov on 10.04.2022.
//

import Foundation
import UIKit


class ProfileViewController: UIViewController {
    
    let phv = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       self.view.backgroundColor = .lightGray
       // view.constraints = safe
        
       
        
        //phv.customize()
      //  view.addSubview(phv.userPic)
       // view.addSubview(phv.textLabel)
        
        
        view.addSubview(phv)
        
    }
    
    override func viewWillLayoutSubviews() {
        phv.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    
    
}
