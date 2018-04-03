//
//  ViewController.swift
//  TestTabBarView
//
//  Created by Jose David Bustos H on 01-04-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    let itemnames = ["MacBook Air i5", "MacBook Retina i7", "MacBook Pro i5", "MacBook 11 i5", "MacBook air i3"]
    
    let photos = ["5777959", "5777967", "5771967", "5771916", "5771915"]
    
    let Desc = ["MacBook Air Intel Core i5 8GB RAM 128GB SDD 13 $549990",
                "MacBook Air Intel Core i5 8GB RAM 256GB SDD 13 $899.990",
                "MacBook Air Intel Core i5 8GB RAM 512GB SDD 13 $499.990",
                "MacBook Air Intel Core i5 8GB RAM 1T SDD 11 $599.990",
                "MacBook Air Intel Core i5 8GB RAM 1T SDD 13 $699.990"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemnames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let itemNameLabel = cell.viewWithTag(1) as! UILabel
        let DescLabel = cell.viewWithTag(2) as! UILabel
        var PhotoImageView = cell.viewWithTag(3) as! UIImageView
        
        itemNameLabel.text = itemnames[indexPath.row]
         DescLabel.text = Desc[indexPath.row]
        PhotoImageView.image = UIImage(named: (photos[indexPath.row] + ".jpeg"))
        
        return cell
        
    }
    
    }


