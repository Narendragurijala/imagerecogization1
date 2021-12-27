//
//  DogViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 21/12/21.
//

import UIKit



class DogViewController: UIViewController {

    @IBOutlet var petName: UILabel!
    @IBOutlet var petLegs: UILabel!
    @IBOutlet var petDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let model = DogViewModel(name: "Fido")
        
        petName.text = model.dogLegs
        petLegs.text = model.dogLegs
        petDesc.text = model.dogNameAndLegs
        
        
    }

}
