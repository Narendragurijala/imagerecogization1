//
//  MycartViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import UIKit

class MycartViewController: UIViewController {
    @IBOutlet var shadowview: UIView!
    @IBOutlet var change: UIButton!
    @IBOutlet var scrolview: UIScrollView!
    @IBOutlet var placeore: UIButton!
    
    
    @IBOutlet var mainView: UIView!
    
    @IBAction func PlaceOrder(_ sender: Any) {
    }
    @IBAction func crossbutton(_ sender: UIButton) {
        self.mainView.isHidden = true
    }
    @IBAction func underlinetextfiled(_ sender: Any) {
    }
    @IBOutlet var underlinetextfield: UITextField!
    @IBOutlet var croaa: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

//        shadowview.layer.shadowColor = UIColor.gray.cgColor
//        shadowview.layer.masksToBounds = false
//        shadowview.layer.shadowOffset = CGSize(width: 0.0 , height: 5.0)
//        shadowview.layer.shadowOpacity = 1.0
//        shadowview.layer.shadowRadius = 1.0
        
        change.layer.cornerRadius = 3.0
        change.layer.masksToBounds = false
        change.layer.borderWidth = 1.0
        change.layer.borderColor  = UIColor.gray.cgColor
        
        scrolview.contentSize = CGSize(width: 375, height: 1200)
        
        placeore.layer.cornerRadius = 8.0
        placeore.layer.masksToBounds = false
       underlinetextfield.setUnderLine()
    }
    
    @IBAction func change(_ sender: UIButton) {
        self.mainView.isHidden = false
    }
    
    @IBAction func Submitbutton(_ sender: UIButton) {
    }
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

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
