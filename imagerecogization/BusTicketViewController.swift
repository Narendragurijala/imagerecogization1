//
//  BusTicketViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 27/12/21.
//

import UIKit

class BusTicketViewController: UIViewController {
    @IBOutlet var busticketView: UIView!
    @IBOutlet var Dateview: UIView!
    @IBOutlet var Locationview: UIView!
    
    @IBOutlet var searchclaabutton: UIButton!
    @IBOutlet var shadowview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.busticketView.addBottomBorderWithColor(color:UIColor.gray, width:0.5)
        self.Dateview.addBottomBorderWithColor(color:UIColor.gray, width:0.5)
        self.Locationview.addBottomBorderWithColor(color:UIColor.gray, width:0.5)

        shadowview.layer.shadowColor = UIColor.gray.cgColor
        shadowview.layer.masksToBounds = false
        shadowview.layer.shadowOffset = CGSize(width: 0.0 , height: 5.0)
        shadowview.layer.shadowOpacity = 1.0
        shadowview.layer.shadowRadius = 1.0
        
        self.searchclaabutton.layer.cornerRadius = 8.0
        self.searchclaabutton.layer.masksToBounds = true
        
    }
    


}
//extension UIView {
//    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
//        self.layer.addSublayer(border)
//    }
//
//    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
//        self.layer.addSublayer(border)
//    }
//
//    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
//        self.layer.addSublayer(border)
//    }
//
//    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
//        self.layer.addSublayer(border)
//    }
//}
