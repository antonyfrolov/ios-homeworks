//
//  PrePhotosCollectionViewCell.swift
//  Navigation
//
//  Created by antonfrolov on 21.04.2022.
//

import UIKit



class PrePhotosCollectionViewCell: UICollectionViewCell {
    
    weak var myParent:ProfileViewController?
    
    
    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .green
        return $0
    }(UIView())
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.backgroundColor = .black
        button.setTitle("Press", for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  layout()
        contentView.addSubview(button)
        backgroundColor = .green
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        
        /* NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            
            ])*/
            
            button.center = contentView.center
    }
    @objc private func tapAction() {
        //deleg2?.buttonPressed(number: number)
        
        print("Tap")
        
        print(myParent)
        
        let photosVC = PhotosViewController()
        myParent?.navigationController?.pushViewController(photosVC, animated: true)
    }
}


