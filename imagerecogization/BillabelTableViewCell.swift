//
//  BillabelTableViewCell.swift
//  imagerecogization
//
//  Created by Rahul Singh on 20/12/21.
//

import UIKit

class BillabelTableViewCell: UITableViewCell {
    @IBOutlet var bilImage: UIImageView!
    @IBOutlet var bilabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
