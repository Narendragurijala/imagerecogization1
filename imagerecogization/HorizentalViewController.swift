//
//  HorizentalViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 28/12/21.
//

import UIKit

class HorizentalViewController: UIViewController {
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var Horizentalcollectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        scrollview.contentSize = CGSize(width: 400, height: 2300)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HorizentalViewController: UICollectionViewDataSource {
    /// 1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return 10
        
        
    }

    /// 2
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = self.Horizentalcollectionview.dequeueReusableCell(withReuseIdentifier: "HorizentalCollectionViewCell", for: indexPath)as!HorizentalCollectionViewCell

            cell.firendnamelabel.text = "New Launches"
            cell.Image.image = UIImage(named:"mainimage")
        cell.mutualImage.image = UIImage(named:"mymutualfriend")
        cell.addFriendlabel.layer.cornerRadius = 8
        cell.addFriendlabel.layer.masksToBounds = true
        
        cell.removefriendlabel.layer.cornerRadius = 8
        cell.removefriendlabel.layer.masksToBounds = true
        cell.mutualfirendlabel.text = "4Mutualfriendslabel"
            return cell
        }
           

    
}
extension HorizentalViewController: UICollectionViewDelegateFlowLayout {
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
        /// 4
        
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 320)
        }
      
    }

