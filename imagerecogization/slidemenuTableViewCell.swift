//
//  slidemenuTableViewCell.swift
//  imagerecogization
//
//  Created by Rahul Singh on 17/12/21.
//

import UIKit

class slidemenuTableViewCell: UITableViewCell {

    @IBOutlet var myimage: UIImageView!
    @IBOutlet var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
