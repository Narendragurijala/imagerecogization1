//
//  slideViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import UIKit

class slideViewController: UIViewController {
    @IBOutlet var leadingconstraint: NSLayoutConstraint!
    var menuShowing = false
    @IBAction func outlet(_ sender: Any) {
        if (menuShowing) {
            leadingconstraint.constant = -200
        }
        else{
            leadingconstraint.constant = 0
            UIView.animate(withDuration: 1.0, animations:{(
                self.loadViewIfNeeded()
            )})

        }
        menuShowing = !menuShowing
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
