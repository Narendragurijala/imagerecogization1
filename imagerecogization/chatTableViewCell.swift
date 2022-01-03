//
//  chatTableViewCell.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import UIKit

class chatTableViewCell: UITableViewCell {

    @IBOutlet var Timelabel: UILabel!
    @IBOutlet var messagelabel: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
