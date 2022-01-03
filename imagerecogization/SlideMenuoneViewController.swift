//
//  SlideMenuoneViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import UIKit

class SlideMenuoneViewController: UIViewController {

    
    var menu_vc :slidetabelviewViewController!
    
    @IBAction func MenuAction(_ sender: UIBarButtonItem) {
        if AppDelegate.menu_bool{
            show_menu()
        }
        else{
            close_menu()
        }
    }
    @IBAction func buttonaction(_ sender: Any) {
        if AppDelegate.menu_bool{
            show_menu()
        }
        else{
            close_menu()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menu_vc = (self.storyboard?.instantiateViewController(identifier:"slidetabelviewViewController")
                    as!slidetabelviewViewController)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)

            let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeleft.direction = .left
            self.view.addGestureRecognizer(swipeleft)
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                show_menu()
            case .down:
                print("Swiped down")
            case .left:
                print("Swiped left")
                close_menu()
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    func show_menu(){
        UIView.animate(withDuration:0.3) { [self]()->Void in
            self.menu_vc.view.frame = CGRect(x:0, y:60, width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChild(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            AppDelegate.menu_bool = false
            
        }
    }
    func close_menu(){
        UIView.animate(withDuration:0.3,animations:{()->Void in
            self.menu_vc.view.frame = CGRect(x:-UIScreen.main.bounds.size.width, y:60, width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
        }){(finished) in
            self.menu_vc.view.removeFromSuperview()
        }

        
        AppDelegate.menu_bool = true
    }
   

}
