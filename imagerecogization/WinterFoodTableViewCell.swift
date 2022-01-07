//
//  WinterFoodTableViewCell.swift
//  imagerecogization
//
//  Created by Rahul Singh on 06/01/22.
//

import UIKit

class WinterFoodTableViewCell: UITableViewCell {

    @IBOutlet var imageTiltle: UILabel!
    @IBOutlet var oilImage: UIImageView!
    
    
    @IBOutlet var Add: UIButton!
    
    @IBOutlet var Dmart: UILabel!
    
    
    @IBOutlet var Mrplabel: UILabel!
    
    
    @IBOutlet var l151: UILabel!
    
    @IBOutlet var Mygramslabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
