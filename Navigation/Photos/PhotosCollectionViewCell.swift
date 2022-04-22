//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by antonfrolov on 21.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        return $0
    }(UIView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  layout()
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        
          NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            
            ])
    }
    
}
