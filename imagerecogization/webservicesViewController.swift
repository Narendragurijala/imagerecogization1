//
//  webservicesViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 21/12/21.
//

import UIKit

class webservicesViewController: UIViewController {

   
    @IBOutlet weak var tblView: UITableView!
    var viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
//        viewModelUser.vc = self
        viewModelUser.getAllUserData()
    }
    
}

extension webservicesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        //cell?.modelUser = viewModelUser.arrUsers[indexPath.row]
        return cell!
    }
}



