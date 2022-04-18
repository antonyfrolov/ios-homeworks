//
//  LogInViewController.swift
//  Navigation
//
//  Created by antonfrolov on 18.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let nc = NotificationCenter.default
    
    let logoImg: UIImageView = {
        let logoImg = UIImageView()
        logoImg.image = UIImage(named: "logo")
        logoImg.translatesAutoresizingMaskIntoConstraints = false
        return logoImg
    }()
    
    lazy var loginInput: UITextField = {
        $0.placeholder = "Email or phone"
        $0.backgroundColor = .systemGray6
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    lazy var passwordInput: UITextField = {
        $0.placeholder = "Password"
        $0.backgroundColor = .systemGray6
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.isSecureTextEntry = true
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
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
    
    let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIScrollView())
    
    let contentView: UIView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)

        layout()
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        passwordInput.resignFirstResponder()
        loginInput.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc private func tapAction() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func layout(){

        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            /// Обязательно выставить ширину contentView !!!!
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        [logoImg,loginInput,passwordInput,loginButton].forEach({contentView.addSubview($0)})
        
        
        NSLayoutConstraint.activate([
            
        
            logoImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImg.widthAnchor.constraint(equalToConstant: 100),
            logoImg.heightAnchor.constraint(equalToConstant: 100),
            
            loginInput.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: 120),
            loginInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginInput.heightAnchor.constraint(equalToConstant: 50),
            
            passwordInput.topAnchor.constraint(equalTo: loginInput.bottomAnchor),
            passwordInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordInput.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            /// Обязательно закрепиться к низу  contentView !!!!
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        
        ])
        
    }
    

}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
