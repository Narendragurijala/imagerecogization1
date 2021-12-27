//
//  EleTricityViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 20/12/21.
//

import UIKit

class EleTricityViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var billabeltabelview: UITableView!
    
    @IBOutlet var myview: UIView!
    @IBOutlet var myviewTwo: UIView!
    var imgearry = ["aroowpower","NewPower","EdPower"]
    var NamesArray = ["APSPDCL AP YOUTH","CENTRAL power DISTRIBUTIO Distribution N COMPANY LTD.of Andra pradesh","Epdcl Eastern Power  power DISTRIBUTIO Distribution N COMPANY LTD.of "]
    
    let cellReuseIdentifier = "BillabelTableViewCell"
    
    @IBOutlet var billabelscrollview: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myview.layer.cornerRadius = 12
        self.myview.layer.masksToBounds = true
        
        self.myviewTwo.layer.cornerRadius = 12
        self.myviewTwo.layer.masksToBounds = true
        
        billabeltabelview.delegate = self
        billabeltabelview.dataSource = self
        billabelscrollview.contentSize = CGSize(width: 400, height: 2300)


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.NamesArray.count
       }
       
       // create a cell for each table view row
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           // create a new cell if needed or reuse an old one
        let cell:BillabelTableViewCell = billabeltabelview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! BillabelTableViewCell

           // set the text from the data model
           cell.bilabel?.text = self.NamesArray[indexPath.row]
        cell.bilImage?.image = UIImage(named:self.imgearry[indexPath.row])
           
           return cell
       }
       
       // method to run when table view cell is tapped
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("You tapped cell number \(indexPath.row).")
       }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }

}
