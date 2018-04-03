//
//  ViewControllerTableViewCell.swift
//  TestTabBarView
//
//  Created by Jose David Bustos H on 02-04-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
   // @IBOutlet weak var myImage: UIImageView!
   // @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
