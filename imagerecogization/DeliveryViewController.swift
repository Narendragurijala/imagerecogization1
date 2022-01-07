//
//  DeliveryViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 06/01/22.
//

import UIKit

class DeliveryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var comparevieww: UIView!
    
    @IBOutlet var mapView: UIView!
    
    @IBOutlet var DeliveryTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.addBottomBorderWithColor(color: UIColor.gray, width:1.0)
        
        self.comparevieww.addBottomBorderWithColor(color: UIColor.gray, width:1.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 6
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = DeliveryTabelView.dequeueReusableCell(withIdentifier: "DeliveryTableViewCell", for: indexPath) as! DeliveryTableViewCell
        cell.Nivdi.layer.cornerRadius = 10.0
        cell.Nivdi.layer.masksToBounds = true
        cell.Nivdi.layer.borderWidth = 1.0
        cell.Nivdi.layer.borderColor = UIColor.gray.cgColor
        
        cell.Inchlabel.layer.cornerRadius = 10.0
        cell.Inchlabel.layer.masksToBounds = true
        cell.Inchlabel.layer.borderWidth = 1.0
        cell.Inchlabel.layer.borderColor = UIColor.gray.cgColor
        
        cell.NoOptionallabel.layer.cornerRadius = 10.0
        cell.NoOptionallabel.layer.masksToBounds = true
        cell.NoOptionallabel.layer.borderWidth = 1.0
        cell.NoOptionallabel.layer.borderColor = UIColor.gray.cgColor
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "1,03,990")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        
        cell.strikelabel.attributedText = attributeString
        
        return cell
       
        }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        return 350
      }
   


}
