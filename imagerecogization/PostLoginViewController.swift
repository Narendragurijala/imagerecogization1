//
//  PostLoginViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 21/12/21.
//

import UIKit

class PostLoginViewController: UIViewController {

    @IBOutlet weak var lblMessage:UILabel!
    @IBOutlet weak var txtUserName:UITextField!
    @IBOutlet weak var txtPassword:UITextField!

//    var authenticationVM = AuthenticationVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblMessage.isHidden = true
        
    }
    
    @IBAction func loginUser(_ sender: Any) {
        self.lblMessage.isHidden = true
        guard let userName = self.txtUserName.text else {return}
        guard let password = self.txtPassword.text else {return}
        
//        authenticationVM.loginCompletionHandler { [weak self] (status, message) in
//            guard let self = self else {return}
//            if status {
//                self.lblMessage.text = "Logged in with username = \(self.authenticationVM.username) and email = \(self.authenticationVM.email)"
//                self.lblMessage.isHidden = false
//            } else {
//                self.lblMessage.text = message
//                self.lblMessage.isHidden = false
//            }
//        }
//        authenticationVM.authenticateUserWith(userName, andPassword: password)
    }
    

}
