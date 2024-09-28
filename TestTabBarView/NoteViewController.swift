//
//  NoteViewController.swift
//  TestTabBarView
//
//  Created by Jose David Bustos H on 01-04-16.
//  Copyright © 2016 Jose David Bustos H. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    lazy var tableView: UITableView = {
           let table: UITableView = .init()
           table.dataSource = self
           table.delegate = self
           table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
           table.rowHeight = 200.0
           table.separatorColor = UIColor.orange
           table.translatesAutoresizingMaskIntoConstraints = false
           return table
       }()
        
    let products: [Product] = productList.filter { $0.typeDevice == 1 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notebook"
        setupUX()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupUX() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        } else {
            
        }
    }
}

extension NoteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let product = products[indexPath.row]
        
        let itemNameLabel = UILabel()
        itemNameLabel.text = product.itemName
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(itemNameLabel)
        
        let descLabel = UILabel()
        descLabel.text = product.description
        descLabel.font = UIFont.systemFont(ofSize: 12)
        descLabel.textColor = .gray
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(descLabel)
        
        let photoImageView = UIImageView()
        photoImageView.image = UIImage(named: product.photo)
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(photoImageView)
        
   
        NSLayoutConstraint.activate([
          
            photoImageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
            photoImageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            itemNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 5),
            itemNameLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
            itemNameLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),

            descLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor),
            descLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 5),
            descLabel.trailingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor)
        ])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
  
          let detailsVC = DetailsViewController()
          
          let selectedProduct = products[indexPath.row]
          detailsVC.strImage = selectedProduct.photo
          detailsVC.strLabel = selectedProduct.description

          navigationController?.pushViewController(detailsVC, animated: true)
      }
}
