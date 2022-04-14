//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by antonfrolov on 10.04.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var textToPrint: String = statusTextField.text ?? ""
    
    let fullNameLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Ponchik sweet dog"
        text.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        text.textColor = .black
        return text
    }()
    
    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"ponch")
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        return image
    }()
    
    let statusLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Waiting for something.."
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        return text
    }()
    
    let statusTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Waiting for something.."
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.backgroundColor = UIColor.white.cgColor
        text.layer.cornerRadius = 12
        text.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return text
    }()
    
    let setStatusButton: UIButton = {
        let butto = UIButton()
        butto.translatesAutoresizingMaskIntoConstraints = false
        butto.backgroundColor = .blue
        butto.layer.cornerRadius = 20
        butto.layer.shadowRadius = 4
        butto.layer.shadowColor = UIColor.black.cgColor
        butto.layer.shadowOpacity = 0.7
        butto.layer.shadowOffset = CGSize(width: 4, height: 4)
        butto.setTitle("Show status", for: .normal)
        butto.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return butto
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(fullNameLabel)
        fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        
    
    
        

        
        
        addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 34).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        
        addSubview(statusTextField)
        statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8).isActive = true
        statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(setStatusButton)
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 34).isActive = true
        setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        setStatusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapAction() {
        print(textToPrint)
        statusLabel.text = textToPrint
    }
    
    @objc func textChanged(_ textField: UITextField) {
        textToPrint = textField.text!
    }
}
