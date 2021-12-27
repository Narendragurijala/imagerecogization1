//
//  AmazonViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 20/12/21.
//

import UIKit

class AmazonViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var Amazonview: UIView!
    @IBOutlet var retrunHomepage: UILabel!
    
    @IBOutlet var yourAccount: UILabel!
    @IBOutlet var BuyAgain: UILabel!
    @IBOutlet var youorders: UILabel!
    @IBOutlet var yourwishList: UILabel!
    
    @IBOutlet var cameraImage: UIImageView!
    
    @IBOutlet var pagescrollview: UIScrollView!
    @IBOutlet var profileImgView: UIImageView!
    
    @IBOutlet var pagecontroller: UIPageControl!
    
    @IBOutlet var Amazonscrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Amazonview.layer.cornerRadius = 12
        self.Amazonview.layer.masksToBounds = true
        
        self.BuyAgain.layer.cornerRadius = 20
        self.BuyAgain.layer.masksToBounds = true
        self.BuyAgain?.layer.borderColor = UIColor.gray.cgColor
        self.BuyAgain?.layer.borderWidth = 1.0
        
        self.yourAccount.layer.cornerRadius = 20
        self.yourAccount.layer.masksToBounds = true
        self.yourAccount?.layer.borderColor = UIColor.gray.cgColor
        self.yourAccount?.layer.borderWidth = 1.0
        
        
        self.youorders.layer.cornerRadius = 20
        self.youorders.layer.masksToBounds = true
        self.youorders?.layer.borderColor = UIColor.gray.cgColor
        self.youorders?.layer.borderWidth = 1.0
        
        self.yourwishList.layer.cornerRadius = 20
        self.yourwishList.layer.masksToBounds = true
        self.yourwishList?.layer.borderColor = UIColor.gray.cgColor
        self.yourwishList?.layer.borderWidth = 1.0
        
        
        self.retrunHomepage.layer.cornerRadius = 20
        self.retrunHomepage.layer.masksToBounds = true
        self.retrunHomepage?.layer.borderColor = UIColor.gray.cgColor
        self.retrunHomepage?.layer.borderWidth = 1.0
        
        Amazonscrollview.contentSize = CGSize(width: 400, height: 2300)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cameraImage.isUserInteractionEnabled = true
        cameraImage.addGestureRecognizer(tapGestureRecognizer)

    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        showAlert()
   
    }
    private func showAlert() {

          let alert = UIAlertController(title: "Image Selection", message: "From where you want to pick this image?", preferredStyle: .actionSheet)
          alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
              self.getImage(fromSourceType: .camera)
          }))
          alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
              self.getImage(fromSourceType: .photoLibrary)
          }))
          alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
          self.present(alert, animated: true, completion: nil)
      }
    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

           //Check is source type available
           if UIImagePickerController.isSourceTypeAvailable(sourceType) {

               let imagePickerController = UIImagePickerController()
               imagePickerController.delegate = self
               imagePickerController.sourceType = sourceType
               self.present(imagePickerController, animated: true, completion: nil)
           }
       }

       //MARK:- UIImagePickerViewDelegate.
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

           self.dismiss(animated: true) { [weak self] in

               guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
               //Setting image to your image view
               self?.profileImgView.image = image
           }
       }

       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
}
