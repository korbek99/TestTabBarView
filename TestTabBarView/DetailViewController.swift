//
//  DetailViewController.swift
//  TestTabBarView
//
//  Created by Jose David Bustos H on 02-04-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    //current controller IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    //data from previous controller
    var nameString:String!
    var dobString:String!
    var imageString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        self.nameLabel.text = nameString
        self.dobLabel.text = dobString
        
        //let imgURL = URL(string:nameString + ".jpg")
        
        let image = UIImage(named: nameString + ".jpg")
        self.imageView.image = image
        
        //let data = NSData(contentsOf: (imgURL)!)
        // self.imageView.image = UIImage(data: data as! Data)
    }
}
