//
//  PopUpUpController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 05/01/22.
//

        import UIKit

    class PopUpUpController: UIViewController {

        @IBOutlet weak var mainView: UIView!
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            self.addAnimation()
        }
        
        @IBAction func closePopup(_ sender: Any) {
            removeAnimation()
        }

        func addAnimation()  {
            self.mainView.transform = CGAffineTransform(translationX: 0, y: self.mainView.frame.height)
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.transform = .identity
            })
        }
        
        private func removeAnimation(){
            self.mainView.transform = .identity
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.transform = CGAffineTransform(translationX: 0, y: self.mainView.frame.height)
            }) { (complete) in
                self.view.removeFromSuperview()
            }
        }
    }
