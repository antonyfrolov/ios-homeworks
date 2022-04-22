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
    
    private let layoutCol: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
       return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray
        $0.isScrollEnabled = false
        $0.isUserInteractionEnabled = false 
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
        
        [whiteView, titlePhotos, collectionView].forEach{contentView.addSubview($0)}
    
        let screenSize: CGRect = UIScreen.main.bounds
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            titlePhotos.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            titlePhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            
            collectionView.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: inset),
            collectionView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset)
        ])
    }

}
    

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrePhotosCollectionViewCell.identifier, for: indexPath) as! PrePhotosCollectionViewCell
        
            cell.myParent = self.myParent
        
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("hi!")
        let photosVC = PhotosViewController()
        myParent?.navigationController?.pushViewController(photosVC, animated: true)
    }
    
}
