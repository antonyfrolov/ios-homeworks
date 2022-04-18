//
//  LogInViewController.swift
//  Navigation
//
//  Created by antonfrolov on 18.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logoImg: UIImageView = {
        let logoImg = UIImageView()
        logoImg.image = UIImage(named: "logo")
        logoImg.translatesAutoresizingMaskIntoConstraints = false
        return logoImg
    }()
    
    let loginInput: UITextField = {
        let loginInput = UITextField()
        loginInput.placeholder = "Email or phone"
        loginInput.backgroundColor = .systemGray6
        loginInput.layer.cornerRadius = 10
        loginInput.layer.borderColor = UIColor.lightGray.cgColor
        loginInput.layer.borderWidth = 0.5
        loginInput.translatesAutoresizingMaskIntoConstraints = false
        return loginInput
    }()
    
    let passwordInput: UITextField = {
        let passwordInput = UITextField()
        passwordInput.placeholder = "Password"
        passwordInput.backgroundColor = .systemGray6
        passwordInput.layer.cornerRadius = 10
        passwordInput.layer.borderColor = UIColor.lightGray.cgColor
        passwordInput.layer.borderWidth = 0.5
        passwordInput.isSecureTextEntry = true
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        return passwordInput
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.clipsToBounds = true
        loginButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return loginButton
    }()
    
    let scrollView:UIScrollView = {
        let sc = UIScrollView(frame: .zero)
       // sc.translatesAutoresizingMaskIntoConstraints = false
        //sc.isPagingEnabled = true
        
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        
        [logoImg,loginInput,passwordInput,loginButton].forEach({scrollView.addSubview($0)})

        layout()
    }
    
    @objc private func tapAction() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func layout(){
        
        NSLayoutConstraint.activate([
        
            logoImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            logoImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            logoImg.widthAnchor.constraint(equalToConstant: 100),
            logoImg.heightAnchor.constraint(equalToConstant: 100),
            
            loginInput.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: 120),
            loginInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginInput.heightAnchor.constraint(equalToConstant: 50),
            
            passwordInput.topAnchor.constraint(equalTo: loginInput.bottomAnchor, constant: 0),
            passwordInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordInput.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        
        
        ])
        
    }
    

}
