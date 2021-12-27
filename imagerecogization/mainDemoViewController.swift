//
//  mainDemoViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 24/12/21.
//

import UIKit

class mainDemoViewController: UIViewController {

    @IBOutlet var mainscrollview: UIScrollView!
    @IBOutlet var superIconcollectionview: UICollectionView!
    @IBOutlet var maincollectionviewtwo: UICollectionView!
    @IBOutlet var searchview: UIView!
    var movies: [String] = ["imageone","imagtwo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchview.layer.cornerRadius = 10
        self.searchview.layer.masksToBounds = true
        mainscrollview.contentSize = CGSize(width: 400, height: 2300)
    }
    

    

}
extension mainDemoViewController: UICollectionViewDataSource {
    /// 1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return 10
        
        
    }

    /// 2
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == superIconcollectionview {
            let cell = self.superIconcollectionview.dequeueReusableCell(withReuseIdentifier: "mainDemoCollectionViewCell", for: indexPath)as!mainDemoCollectionViewCell

            cell.collectionLabel.text = "New Launches"
            cell.collectionimage.image = UIImage(named:"Fashion")
            return cell
        }
        else{
            let cell = self.maincollectionviewtwo.dequeueReusableCell(withReuseIdentifier: "DemoCollectionViewCell", for: indexPath)as!DemoCollectionViewCell
            
            cell.label.text = "New Launches"
//            cell.image.image = UIImage(named:"imageone")
            
            for index in 0..<movies.count {
            
                cell.image.image = UIImage(named:movies[index])
                }
            
            
            return cell
            
        }
       
    }
}
extension mainDemoViewController: UICollectionViewDelegateFlowLayout {
    /// 1
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        /// 2
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }

    /// 3
    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
      
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 3 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 180)
        
      
    }
}

