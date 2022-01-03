//
//  chatTabelViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import UIKit

class chatTabelViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var chattabelview: UITableView!

    var imageString2:[String] = ["Man1","man2","man3","man4"]
    var numbers:[String] = ["24788988899","LaKshmi","Raguramsajji","Rammohan"]
    var message:[String] = ["Okay","Done","Sure","call Me"]
    var Dates:[String]  = ["12/07/1995","10/8/2021","1/3/1998","7/8/1990"]
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Camerabutton(_ sender: UIButton) {
//        let imagePickerController = UIImagePickerController()
//           imagePickerController.allowsEditing = false //If you want edit option set "true"
//           imagePickerController.sourceType = .photoLibrary
//           imagePickerController.delegate = self
//           present(imagePickerController, animated: true, completion: nil)
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
           alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
               self.openCamera()
           }))
           
           alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
               self.openGallary()
           }))
           
           alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
           
           /*If you want work actionsheet on ipad
           then you have to use popoverPresentationController to present the actionsheet,
           otherwise app will crash on iPad */
           switch UIDevice.current.userInterfaceIdiom {
           case .pad:
               alert.popoverPresentationController?.sourceView = sender
               alert.popoverPresentationController?.sourceRect = sender.bounds
               alert.popoverPresentationController?.permittedArrowDirections = .up
           default:
               break
           }
           
           self.present(alert, animated: true, completion: nil)

           }
    func openCamera()
        {
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
            {
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }

        func openGallary()
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        imgRoom.image  = tempImage
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return self.imageString2.count
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = chattabelview.dequeueReusableCell(withIdentifier: "chatTableViewCell", for: indexPath) as! chatTableViewCell
        cell.imageview.image = UIImage(named:self.imageString2[indexPath.row])
        cell.imageview.contentMode = .scaleToFill
        cell.imageview.layer.cornerRadius = cell.imageview.frame.size.width/2
        cell.imageview.layer.masksToBounds = true
        cell.Timelabel.text = self.Dates[indexPath.row]
        cell.messagelabel.text = self.numbers[indexPath.row]
        cell.label.text = self.message[indexPath.row]
        return cell
       
        }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        return 85
      }
    
    
}
