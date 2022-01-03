//
//  MyTabViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 29/12/21.
//

import UIKit


class MyTabViewController: UIViewController {
        @IBOutlet weak var tblView: UITableView!
        var viewModelUser = UserViewModel()
        override func viewDidLoad() {
            super.viewDidLoad()
            tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
            viewModelUser.vc = self
            viewModelUser.getAllUsreDataAF()
        }
        
    }

    extension MyTabViewController: UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModelUser.arrUsers.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
            cell?.modelUser = viewModelUser.arrUsers[indexPath.row]
            return cell!
        }
    }
