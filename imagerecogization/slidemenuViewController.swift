//
//  slidemenuViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 17/12/21.
//

import UIKit

class slidemenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var arrdata = ["uSERNAME","eMAIL","eDUCATION","mOBILE","lOGOUT"]
    var arrimg = [#imageLiteral(resourceName: "name"),#imageLiteral(resourceName: "email"),#imageLiteral(resourceName: "qual"),#imageLiteral(resourceName: "mobile"),#imageLiteral(resourceName: "password")]
    @IBOutlet var sideview: UIView!
  
    @IBOutlet var sidebar: UITableView!
    var isSideViewOpen: Bool = false
    
    
    @IBOutlet var backbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sidebar.delegate = self
        sidebar.dataSource = self

        sideview.isHidden = true
        sidebar.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false    }
    

    @IBAction func mybackbutton(_ sender: UIButton) {
        sidebar.isHidden = false
        sideview.isHidden = false
        self.view.bringSubviewToFront(sideview)
        if !isSideViewOpen{
            isSideViewOpen = true//0
            sideview.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)//1
            sideview.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.commitAnimations()
            
        }else{
            sidebar.isHidden = true
            sideview.isHidden = true
            isSideViewOpen = false
            sideview.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideview.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            UIView.commitAnimations()
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:slidemenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "slidemenuTableViewCell") as! slidemenuTableViewCell
        cell.myimage.image = arrimg[indexPath.row]
        cell.label.text = arrdata[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            let uname:unameViewController = self.storyboard?.instantiateViewController(withIdentifier: "uname") as! unameViewController
            self.navigationController?.pushViewController(uname, animated: true)
        }//username
    }

}
