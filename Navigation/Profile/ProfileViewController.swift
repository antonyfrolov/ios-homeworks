//
//  ProfileViewController.swift
//  Navigation
//
//  Created by antonfrolov on 10.04.2022.
//

import Foundation
import UIKit


class ProfileViewController: UIViewController {
    
    
    let postsList: [Post] = Post.presetData()
    
    
    
    lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return $0
    }(UITableView())
   
    /*let newButton: UIButton = {
        let newButton = UIButton()
        newButton.setTitle("New button", for: .normal)
        newButton.backgroundColor = .blue
        return newButton
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .lightGray
       // view.addSubview(phv)
        view.addSubview(tableView)
       // view.addSubview(newButton)
        layout()
        
    }
    
    private func layout(){
        
        
        
        
        
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        
        
       /* newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        newButton.heightAnchor.constraint(equalToConstant: 50).isActive = true*/
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
      //  detailVC.setupVC(model: carModel[indexPath.section][indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
