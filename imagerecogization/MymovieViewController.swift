//
//  MymovieViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 29/12/21.
//

import UIKit

class MymovieViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    var arrMovieVM = [MovieViewModel1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }

    func getData(){
//        Service.shareInstance.getAllMovieData { (movies, error) in
//            if(error==nil){
//                self.arrMovieVM = movies?.map({ return MovieViewModel1(movie: $0) }) ?? []
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }

    }

}

extension MymovieViewController: UITableViewDelegate, UITableViewDataSource{
    
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
