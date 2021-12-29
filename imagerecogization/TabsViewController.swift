//
//  TabsViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 28/12/21.
//

import UIKit

class TabsViewController: UIViewController {
    var proFileString:[String] = ["Reel","Room","Group","Live"]
    var imageString:[String] = ["Reel","Room","Group","Live"]
    var imageString1:[String] = ["ManTwo","ManTwo","ManTwo","ManTwo"]
    var imageString2:[String] = ["storyTwo","storyTwo","storyTwo","storyTwo"]

    @IBOutlet var createroomcollectionview: UICollectionView!
    @IBOutlet var shadowview: UIView!
    
    @IBOutlet var storycollectionview: UICollectionView!
    
    @IBOutlet var shadowviewtwo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileview.layer.cornerRadius = 26
        self.profileview.layer.masksToBounds = true
        self.profileview.layer.borderColor = UIColor.black.cgColor
        self.profileview.layer.borderWidth = 0.6
        
        shadowview.layer.shadowColor = UIColor.gray.cgColor
        shadowview.layer.masksToBounds = false
        shadowview.layer.shadowOffset = CGSize(width: 0.0 , height: 5.0)
        shadowview.layer.shadowOpacity = 1.0
        shadowview.layer.shadowRadius = 1.0
        
        
        shadowviewtwo.layer.shadowColor = UIColor.gray.cgColor
        shadowviewtwo.layer.masksToBounds = false
        shadowviewtwo.layer.shadowOffset = CGSize(width: 0.0 , height: 5.0)
        shadowviewtwo.layer.shadowOpacity = 1.0
        shadowviewtwo.layer.shadowRadius = 1.0
        
    }
    @IBOutlet var roomcollectionview: UICollectionView!
    
    @IBOutlet var profileview: UIView!
    @IBAction func HomeIcon(_ sender: UIButton) {
    }
    
    @IBAction func ProfileIcon(_ sender: Any) {
    }
    @IBAction func video(_ sender: Any) {
    }
    @IBAction func videoNotification(_ sender: Any) {
    }
    @IBAction func Notification(_ sender: UIButton) {
    }
    @IBAction func Menu(_ sender: UIButton) {
    }
    
    
    
    
    
}
extension TabsViewController: UICollectionViewDataSource {
    /// 1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return 4
        
        
    }

    /// 2
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        if collectionView == roomcollectionview {
            let cell = self.roomcollectionview.dequeueReusableCell(withReuseIdentifier: "roomsCollectionViewCell", for: indexPath)as!roomsCollectionViewCell

        cell.rommslabel.text = self.proFileString[indexPath.row]
        cell.roomsimage.image = UIImage(named:self.imageString[indexPath.row])
            return cell
        }
        else if collectionView == storycollectionview{
            let cell = self.storycollectionview.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath)as!StoryCollectionViewCell
        cell.imageview.image = UIImage(named:self.imageString2[indexPath.row])
            return cell
        }
        else{
            let cell = self.createroomcollectionview.dequeueReusableCell(withReuseIdentifier: "createroomCollectionViewCell", for: indexPath)as!createroomCollectionViewCell
        cell.roomiamge.image = UIImage(named:self.imageString1[indexPath.row])
            return cell
        }
        }
           

    }
extension TabsViewController: UICollectionViewDelegateFlowLayout {
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
        if collectionView  == roomcollectionview{
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 3 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 180)
        }
        else{
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 3 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 150)
        }
       
           
        
      
    }
}

