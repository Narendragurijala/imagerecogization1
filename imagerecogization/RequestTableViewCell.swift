//
//  RequestTableViewCell.swift
//  imagerecogization
//
//  Created by Rahul Singh on 28/12/21.
//

import UIKit

class RequestTableViewCell: UITableViewCell {
    @IBOutlet var Addfirend: UIButton!
    
    @IBOutlet var Removefriend: UIButton!
    @IBOutlet var mutualfriendslabel: UILabel!
    @IBOutlet var smallCircleimage: UIImageView!
    @IBOutlet var friendNamelabel: UILabel!
    @IBOutlet var circleimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
