//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by antonfrolov on 21.04.2022.
//

import UIKit


class PhotosTableViewCell: UITableViewCell {
    
    weak var myParent:ProfileViewController?

    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBrown
        return $0
    }(UIView())
    
    private let titlePhotos: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
       // $0.numberOfLines = 2
        $0.text = "Photos"
        return $0
    }(UILabel())
    
    private let imagePhotos: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
       // $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .black
        return $0
    }(UIImageView())
    
    private let layoutCol: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
       return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.isScrollEnabled = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(PrePhotosCollectionViewCell.self, forCellWithReuseIdentifier: PrePhotosCollectionViewCell.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layoutCol))
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
    
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        /*
        [whiteView, titlePhotos, imagePhotos].forEach{contentView.addSubview($0)}
    
        
        let screenSize: CGRect = UIScreen.main.bounds
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            titlePhotos.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            titlePhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            
            imagePhotos.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: inset),
            imagePhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            imagePhotos.widthAnchor.constraint(equalToConstant: 50),
            imagePhotos.heightAnchor.constraint(equalToConstant: 50)
        ])*/
    }

}
    

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrePhotosCollectionViewCell.identifier, for: indexPath) as! PrePhotosCollectionViewCell
        
            cell.myParent = self.myParent
        
        
        return cell
        
    }
    
    
}

extension PhotosTableViewCell: UICollectionViewDelegate {
    
}
