//
//  DeliveryTableViewCell.swift
//  imagerecogization
//
//  Created by Rahul Singh on 06/01/22.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {

    @IBOutlet var Nivdi: UIButton!
    @IBOutlet var Inchlabel: UIButton!
    @IBOutlet var NoOptionallabel: UIButton!
    @IBOutlet var strikelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
