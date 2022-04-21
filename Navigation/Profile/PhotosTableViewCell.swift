//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by antonfrolov on 21.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBrown
        return $0
    }(UIView())
    
    private let titlePhotos: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.text = "testTextTitle"
        return $0
    }(UILabel())
    
    private let imagePhotos: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .black
        return $0
    }(UIImageView())
    
    
    
    private func layout() {
        [whiteView, titlePhotos, imagePhotos].forEach{contentView.addSubview($0)}
    
        
        let screenSize: CGRect = UIScreen.main.bounds
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }

}
    
