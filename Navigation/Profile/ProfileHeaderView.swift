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
    
    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let fullNameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Ponchik sweet dog"
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private let avatarImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named:"ponch")
        $0.layer.cornerRadius = 50
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let statusLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Waiting for something.."
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
        return $0
    }(UILabel())
    
    private let statusTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Waiting for something.."
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.backgroundColor = UIColor.white.cgColor
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return $0
    }(UITextField())
    
    private let setStatusButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.setTitle("Show status", for: .normal)
        $0.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        addGestureRecognizer(tapGesture)
        
        layout()
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        statusTextField.resignFirstResponder()
    }
    
    private func layout()
    {
        
        addSubview(whiteView)
        
        [avatarImageView,fullNameLabel,statusLabel,statusTextField,setStatusButton].forEach{whiteView.addSubview($0)}
        
        let inset: CGFloat = 16
        
        
        NSLayoutConstraint.activate([
        
            whiteView.topAnchor.constraint(equalTo: self.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            avatarImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: inset),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 34),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: inset),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: inset),
            statusTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: inset),
            setStatusButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            setStatusButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
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
