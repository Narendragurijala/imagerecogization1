//
//  MVVMViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 04/01/22.
//

import UIKit

class MVVMViewController: UIViewController {


        @IBOutlet var tableView: UITableView!
        var arrMovieVM = [MYMovieViewModel]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.getData()
        }

        func getData(){
            Service.shareInstance.getAllMovieData { (movies, error) in
                if(error==nil){
                    self.arrMovieVM = movies?.map({ return MYMovieViewModel(movie: $0) }) ?? []
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }

        }

    }

    extension MVVMViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrMovieVM.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let MVM = arrMovieVM[indexPath.row]
            cell.textLabel?.text = MVM.artistName ?? ""
            cell.detailTextLabel?.text = MVM.trackName ?? ""
            return cell
        }
        
    }

