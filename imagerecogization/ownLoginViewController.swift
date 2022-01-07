//
//  ownLoginViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 04/01/22.
//

import UIKit

class ownLoginViewController: UIViewController {

    
    @IBOutlet var signupbutton: UIButton!
    
    @IBAction func textfielsone(_ sender: Any) {
    }
    @IBAction func Signupbutton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        firstTextfield.useUnderline()
        secondtextfield.useUnderline()
        
        signupbutton.layer.cornerRadius = 3.0
        signupbutton.layer.masksToBounds = true
        signupbutton.layer.borderWidth = 1.0
        signupbutton.layer.borderColor = UIColor.black.cgColor
        
        firstTextfield.setLeftPaddingPoints(10)
        firstTextfield.setRightPaddingPoints(10)
        
        secondtextfield.setLeftPaddingPoints(10)
        secondtextfield.setRightPaddingPoints(10)
        
    }
    
    @IBOutlet var firstTextfield: UITextField!
    
    @IBOutlet var secondtextfield: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UITextField {
    
    func useUnderline() {

        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
