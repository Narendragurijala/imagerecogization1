//
//  FlipkartViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 20/12/21.
//

import UIKit

class FlipkartViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet var viewOne: UIView!
    @IBOutlet var searchbuttonview: UIView!
    
    @IBOutlet var pagecontroller: UIPageControl!
    @IBOutlet var scollview: UIScrollView!
    @IBOutlet var searchbutton: UIButton!
    var movies: [String] = ["bad-boys","joker","hollywood"]
    var frame = CGRect.zero

    @IBOutlet var Horizentalcollectionview: UICollectionView!
    
    
    
    @IBOutlet var flipkartscrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let yourColor : UIColor = UIColor.gray
        viewOne.layer.masksToBounds = true
        viewOne.layer.borderColor = yourColor.cgColor
        viewOne.layer.borderWidth = 1.0
        self.searchbuttonview.layer.cornerRadius = 10
        self.searchbuttonview.layer.masksToBounds = true
        
        pagecontroller.numberOfPages = movies.count
        setupScreens()
        scollview.delegate = self
        flipkartscrollview.contentSize = CGSize(width: 400, height: 2300)


    }
    func setupScreens() {
        for index in 0..<movies.count {
            frame.origin.x = scollview.frame.size.width * CGFloat(index)
            frame.size = scollview.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: movies[index])
            
            self.scollview.addSubview(imgView)
        }
        
        scollview.contentSize = CGSize(width: (scollview.frame.size.width * CGFloat(movies.count)), height: scollview.frame.size.height)
        scollview.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scollview: UIScrollView) {
        let pageNumber = scollview.contentOffset.x / scollview.frame.size.width
        pagecontroller.currentPage = Int(pageNumber)
    }
    
}
extension FlipkartViewController: UICollectionViewDataSource {
    /// 1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return 10
        
        
    }

    /// 2
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = self.Horizentalcollectionview.dequeueReusableCell(withReuseIdentifier: "flipkartCollectionViewCell", for: indexPath)as!flipkartCollectionViewCell

            cell.roundedlabel.text = "New Launches"
            cell.roundedimage.image = UIImage(named:"collectionviewtwo")
            return cell
        }
           

    
}
extension FlipkartViewController: UICollectionViewDelegateFlowLayout {
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
            let widthPerItem = collectionView.frame.width / 3 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 180)
      
    }
}

extension UIView {
    func addBorder(toEdges edges: UIRectEdge, color: UIColor, thickness: CGFloat) {

        func addBorder(toEdge edges: UIRectEdge, color: UIColor, thickness: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor

            switch edges {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            case .bottom:
                border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
            case .right:
                border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            default:
                break
            }

            layer.addSublayer(border)
        }

        if edges.contains(.top) || edges.contains(.all) {
            addBorder(toEdge: .top, color: color, thickness: thickness)
        }

        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(toEdge: .bottom, color: color, thickness: thickness)
        }

        if edges.contains(.left) || edges.contains(.all) {
            addBorder(toEdge: .left, color: color, thickness: thickness)
        }

        if edges.contains(.right) || edges.contains(.all) {
            addBorder(toEdge: .right, color: color, thickness: thickness)
        }
    }
}

