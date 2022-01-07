//
//  EmiAvailabelViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 07/01/22.
//

import UIKit

class EmiAvailabelViewController: UIViewController {
    @IBOutlet var searchAmazonview: UIView!
    
    @IBOutlet var cornerView: UIView!
    
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var processedby8items: UIButton!
    
    
    @IBOutlet var addgiftotion: UIView!
    
    @IBOutlet var Deletebutton: UIButton!
    
    @IBOutlet var Saveforlatter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchAmazonview.layer.cornerRadius = 10.0
        self.searchAmazonview.layer.masksToBounds = true
        
        self.cornerView.layer.cornerRadius = 10.0
        self.cornerView.layer.masksToBounds = true
        
        self.processedby8items.layer.cornerRadius = 10.0
        self.processedby8items.layer.masksToBounds = true
        self.addgiftotion.addBottomBorderWithColor(color:UIColor.gray, width:0.5)
        scrollview.contentSize = CGSize(width:375, height:1400)

        Deletebutton.layer.cornerRadius = 12.0
        Deletebutton.layer.masksToBounds = false
        Deletebutton.layer.borderColor = UIColor.gray.cgColor
        Deletebutton.layer.borderWidth = 1.0

        Saveforlatter.layer.cornerRadius = 12.0
        Saveforlatter.layer.masksToBounds = false
        Saveforlatter.layer.borderColor = UIColor.gray.cgColor
        Saveforlatter.layer.borderWidth = 1.0
        
    }
  

}
