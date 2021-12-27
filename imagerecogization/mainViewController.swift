//
//  mainViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 17/12/21.
//

import UIKit

class mainViewController: UIViewController {

    @IBOutlet var btnmenuopen: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        revealViewController().rightViewRevealWidth = 250
        btnmenuopen.target = revealViewController()
        btnmenuopen.action = #selector(SWRevealViewController.rightRevealToggle(_:))    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
