//
//  slidetabelviewViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import UIKit

class slidetabelviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var message:[String] = ["Okay","Done","Sure","call Me"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet var slideTabelview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return self.message.count
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = slideTabelview.dequeueReusableCell(withIdentifier: "menufinalTableViewCell", for: indexPath) as! menufinalTableViewCell
    
        cell.myLabel.text = self.message[indexPath.row]
        return cell
       
        }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        return 85
      }

}
