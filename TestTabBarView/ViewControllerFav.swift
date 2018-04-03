//
//  ViewControllerFav.swift
//  TestTabBarView
//
//  Created by Jose David Bustos H on 01-04-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerFav: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let itemnames = ["Funda Plastica Macbook", "Conexion HDMI", "Funda con Cierre", "Mouse Mac", "MacBook air i3"]
    
    let photos = ["5678940", "5678941", "5678942", "5678945", "5785639"]
    
    let Desc = ["Funda Plastica Macbook $7990",
                "Conexion HDMI $8.990",
                "Funda con Cierre tipo Bolso $9.990",
                "Mouse Mac $12.990",
                "MacBook Mini  i5 4GB RAM 256 SDD 13 $599.990"]
    
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
