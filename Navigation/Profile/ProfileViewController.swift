//
//  ProfileViewController.swift
//  Navigation
//
//  Created by antonfrolov on 10.04.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    private let postsList: [Post] = Post.presetData()
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .lightGray
       // view.addSubview(phv)
        view.addSubview(tableView)
        layout()
        
    }
    
    private func layout(){
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        /*
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        var context: UIListContentConfiguration = cell.defaultContentConfiguration()
        context.text = "Секция = \(indexPath.section), ячейка = \(indexPath.row)"
       // context.image = UIImage(named: "ponch")
        cell.contentConfiguration = context
        return cell*/
        
//        let modelArray = carModel[indexPath.section]
//        let model = modelArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
       
        cell.setupCell(postsList[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let phv = ProfileHeaderView()
        return phv
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let detailVC = PostViewController()
      //  detailVC.setupVC(model: carModel[indexPath.sectio[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
