//
//  TableViewCell.swift
//  imagerecogization
//
//  Created by Rahul Singh on 18/11/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var cellimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
