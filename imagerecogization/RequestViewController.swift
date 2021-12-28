//
//  RequestViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 28/12/21.
//

import UIKit

class RequestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    

    @IBOutlet var requests: UIButton!
    @IBOutlet var requesTabelview: UITableView!
    
    @IBOutlet var yourfriends: UIButton!
    var names:[String] = ["ArendraKumar","VenkatKumar","PavanKumar","Tirupathamma","Aswini chowdary"]
    var mutualFriend:[String] = ["1MutualFriend","2MutualFriend","3Mutualfirned","4mutualfriend","5Mutualfriend"]
    var circle:[String] = ["circle","circle","circle","circle","circle"]
    var smallcircle:[String] = ["smallcircle","smallcircle","smallcircle","smallcircle","smallcircle"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.requests.layer.cornerRadius = 18.0
        self.requests.layer.masksToBounds = true

        self.yourfriends.layer.cornerRadius = 18.0
        self.yourfriends.layer.masksToBounds = true
        
//        self.requesTabelview.register(RequestTableViewCell.self, forCellReuseIdentifier:"RequestTableViewCell")

    }
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int
            {
        return self.names.count
            }

            func numberOfSectionsInTableView(tableView:UITableView!)->Int
            {
                return 1
            }

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = requesTabelview.dequeueReusableCell(withIdentifier:"RequestTableViewCell", for: indexPath) as! RequestTableViewCell
        cell.circleimage.layer.masksToBounds = false
        cell.circleimage.layer.borderColor = UIColor.black.cgColor
        cell.circleimage.layer.cornerRadius = cell.circleimage.frame.height/2-10
        cell.circleimage.clipsToBounds = true
        
        cell.smallCircleimage.layer.masksToBounds = false
        cell.smallCircleimage.layer.borderColor = UIColor.black.cgColor
        cell.smallCircleimage.layer.cornerRadius = cell.circleimage.frame.height/2-40
        cell.smallCircleimage.clipsToBounds = true
        
        cell.Addfirend.layer.cornerRadius = 10
        cell.Addfirend.layer.masksToBounds = true
        
        cell.Removefriend.layer.cornerRadius = 10
        cell.Removefriend.layer.masksToBounds = true
        
        cell.friendNamelabel.text = self.names[indexPath.row]
        cell.mutualfriendslabel.text = self.mutualFriend[indexPath.row]

        
        let myCellImage = UIImage(named: circle[indexPath.item])
        let myCellImageTwo = UIImage(named: smallcircle[indexPath.item])

            cell.circleimage.image = myCellImage
        cell.smallCircleimage.image = myCellImageTwo

        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 // the height you want
      
      }
    
    

}
