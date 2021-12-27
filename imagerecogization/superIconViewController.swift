//
//  superIconViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 16/12/21.
//

import UIKit

class superIconViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet var firstbutton: UIButton!
    
    @IBOutlet var secondbutton: UIButton!
    
    @IBOutlet var thirdbutton: UIButton!
    
    
    @IBOutlet var firstview: UIView!
    @IBOutlet var secondview: UIView!
    @IBOutlet var thirdview: UIView!
    
    @IBOutlet var superIconcollectionview: UICollectionView!
    
    @IBOutlet var bottomview: UIView!
    
    @IBOutlet var scrollview: UIScrollView!
    
    
    @IBOutlet var pagecontroler: UIPageControl!
    
    @IBOutlet var superflash: UILabel!
    let mainArray: [String] = ["Rewards","Super store","superGames"]

    var movies: [String] = ["bad-boys","bad-boys","bad-boys"]
    var frame = CGRect.zero
    var timer = Timer()
    
    @IBOutlet var supercolelctionviewtwo: UICollectionView!
    
    @IBOutlet var mainscrollview: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.bottomview.addBottomBorderWithColor(color: UIColor.gray, width:1.0)
        superIconcollectionview.delegate = self
        superIconcollectionview.dataSource = self

        mainscrollview.contentSize = CGSize(width: 400, height: 2300)

        self.firstview.isHidden = false
        self.secondview.isHidden = true
        self.thirdview.isHidden = true
        pagecontroler.numberOfPages = movies.count
        self.setupScreens()
    
        
    timer = Timer.scheduledTimer(timeInterval: 1.0,
                                                                   target: self,
                                                                 selector: #selector(tick),
                                                                 userInfo: nil,
                                                                  repeats: true)
    }
    @objc func tick() {
        self.superflash.text = DateFormatter.localizedString(from: NSDate() as Date,
                                                                     dateStyle: .medium,
                                                                     timeStyle:.medium)
        }
    func setupScreens() {
        for index in 0..<movies.count {
            frame.origin.x = scrollview.frame.size.width * CGFloat(index)
            frame.size = scrollview.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: movies[index])
            
            self.scrollview.addSubview(imgView)
        }
        
        scrollview.contentSize = CGSize(width: (scrollview.frame.size.width * CGFloat(movies.count)), height: scrollview.frame.size.height)
        scrollview.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ pagerscrollview: UIScrollView) {
        let pageNumber = pagerscrollview.contentOffset.x / pagerscrollview.frame.size.width
        pagecontroler.currentPage = Int(pageNumber)
    }
    
    @IBAction func firstbutton(_ sender: UIButton) {
        
        self.firstview.isHidden = false
        self.secondview.isHidden = true
        self.thirdview.isHidden = true
    }
    @IBAction func seconbutton(_ sender: UIButton) {
        self.firstview.isHidden = true
        self.secondview.isHidden = false
        self.thirdview.isHidden = true
        
    }
    @IBAction func thirdbutton(_ sender: UIButton) {
        self.firstview.isHidden = true
        self.secondview.isHidden = true
        self.thirdview.isHidden = false
    }
    
   

}
extension superIconViewController: UICollectionViewDataSource {
    /// 1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return 10
        
        
    }

    /// 2
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == supercolelctionviewtwo {
            let cell = self.supercolelctionviewtwo.dequeueReusableCell(withReuseIdentifier: "secondCollectionViewCell", for: indexPath)as!secondCollectionViewCell

            cell.labelone.text = "Flipcart gift card"
            cell.labeltwo.text = "worth 2500 off"
            cell.image.image = UIImage(named:"yaerphone")
            return cell
        }
        else{
            let cell = self.superIconcollectionview.dequeueReusableCell(withReuseIdentifier: "SuperIconCollectionViewCell", for: indexPath)as!SuperIconCollectionViewCell

            cell.label.text = "New Launches"
            cell.image.image = UIImage(named:"collectionviewtwo")
            return cell
        }
           

    }
}
extension superIconViewController: UICollectionViewDelegateFlowLayout {
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
        if collectionView == superIconcollectionview {
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 4 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 120)
        }
        else{
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 3 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 180)
        }
      
    }
}

extension UIView {
  func addTopBorderWithColor(color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
    self.layer.addSublayer(border)
  }

  func addRightBorderWithColor(color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
    self.layer.addSublayer(border)
  }

  func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
    self.layer.addSublayer(border)
  }

  func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
    self.layer.addSublayer(border)
  }
}
