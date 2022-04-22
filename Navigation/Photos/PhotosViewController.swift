//
//  PhotosViewController.swift
//  Navigation
//
//  Created by antonfrolov on 21.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let layoutCol: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
       return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false 
        $0.backgroundColor = .red
        $0.dataSource = self
        $0.delegate = self
        $0.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layoutCol))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        layout()
    }
    

    private func layout(){
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}


extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        
        return cell
        
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegate {
    
}
