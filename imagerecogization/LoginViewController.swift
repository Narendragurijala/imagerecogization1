//
//  LoginViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import UIKit
  
  
class LoginViewController: UIViewController {
  
  
    @IBOutlet weak var sucessView: UIView!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
      
    lazy var presenter = LoginPresenter(view:self)
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sucessView.isHidden = true
    }
      
    @IBAction func clickedSubmitBtn(_ sender: Any) {
        presenter.userName = userEmail.text
        presenter.password = userPassword.text
        presenter.submitButtonClicked()
    }
}
  
  
extension LoginViewController : PresenterView{
    func updateLoginUI() {
        self.sucessView.isHidden = false
    }
      
      
}
