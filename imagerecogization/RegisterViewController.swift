//
//  RegisterViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 31/12/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var registerbutton: UIButton!
    @IBOutlet var bottomview: UIView!
    @IBOutlet var Registerview: UIView!
    @IBOutlet var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        Registerview.layer.masksToBounds = false
        Registerview.layer.shadowRadius = 4
        Registerview.layer.shadowOpacity = 1
        Registerview.layer.shadowColor = UIColor.gray.cgColor
        Registerview.layer.shadowOffset = CGSize(width: 0 , height:2)
        self.bottomview.addBottomBorderWithColor(color: UIColor.gray, width:1.0)
        
        scrollview.contentSize = CGSize(width: 375, height: 850)
        
        registerbutton.layer.cornerRadius = 2.0
        registerbutton.layer.masksToBounds = true
    }

   
    @IBAction func Register(_ sender: Any) {
        
    }
    
}
