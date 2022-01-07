//
//  WinterFoodViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 06/01/22.
//

import UIKit

class WinterFoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var bottomshadowview: UIView!
    
    @IBOutlet var bottomView: UIView!
    
    @IBOutlet var winterfood: UIButton!
    
    @IBOutlet var winteressential: UIButton!
    
    @IBOutlet var grmslabel: UILabel!
    
    @IBOutlet var winterFoodTabelview: UITableView!
    
    var imageCell:[String] = ["DabourHoneyPack","DabourHoneyPack","DabourHoneyPack","DabourHoneyPack","DabourHoneyPack"]
    var gramscell:[String] = ["980 gms","940 gms","870 gms","650 gms","450 gms"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bottomView.addBottomBorderWithColor(color: UIColor.gray, width:1.0)
        
        bottomshadowview.layer.shadowColor = UIColor.gray.cgColor
        bottomshadowview.layer.masksToBounds = false
        bottomshadowview.layer.shadowOffset = CGSize(width: 0.0 , height: 5.0)
        bottomshadowview.layer.shadowOpacity = 1.0
        bottomshadowview.layer.shadowRadius = 1.0
        
        winterfood.layer.cornerRadius = 12.0
        winterfood.layer.masksToBounds = false
        
        winteressential.layer.cornerRadius = 12.0
        winteressential.layer.masksToBounds = false
        winteressential.layer.borderColor = UIColor.gray.cgColor
        winteressential.layer.borderWidth = 1.0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.imageCell.count
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = winterFoodTabelview.dequeueReusableCell(withIdentifier: "WinterFoodTableViewCell", for: indexPath) as! WinterFoodTableViewCell
        
        cell.Mygramslabel.layer.cornerRadius = 10.0
        cell.Mygramslabel.layer.masksToBounds = true
        cell.Mygramslabel.layer.borderWidth = 1.0
        cell.Mygramslabel.layer.borderColor = UIColor.gray.cgColor
        
        cell.Add.layer.cornerRadius = 10.0
        cell.Add.layer.masksToBounds = true
        cell.oilImage.image = UIImage(named:self.imageCell[indexPath.row])
        
        cell.Mygramslabel.text = self.gramscell[indexPath.row]
        cell.Mrplabel.text = "DMart"+"\u{20B9}"+"\(249)"
        cell.l151.text = "\u{20B9}" + "\(151)"+"OFF"
        return cell
       
        }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        return 230
      }
   

}
