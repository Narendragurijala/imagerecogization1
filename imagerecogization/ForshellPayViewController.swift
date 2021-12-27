//
//  ForshellPayViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 27/12/21.
//

import UIKit
import AVFoundation

class ForshellPayViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    var images: [String] = ["scan.png","Pay to contact.png","Balance.png","Transcation.png"]
    var secodimages: [String] = ["Bill PayMents","Mutual Funds"]
    var Thirdimages: [String] = ["Insurance","Game","instant Credit"]
    var seocndnames:[String] = ["Insurance","Game","instant Credit"]

    var names:[String] = ["scan","Pay to contact","Balance","Transcation"]
    @IBOutlet var mobileprepaid: UIImageView!
    @IBOutlet var collectmoney: UIImageView!
    @IBOutlet var mandate: UIImageView!
    @IBOutlet var forpaycollectionview: UICollectionView!
    
    @IBOutlet var seondcollectionview: UICollectionView!
    @IBOutlet var mainscrollview: UIScrollView!
    
    @IBOutlet var Insurancecollectionview: UICollectionView!
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ForshellPayViewController.cellTappedMethod(_:)))
        self.mobileprepaid.isUserInteractionEnabled = true
        self.mobileprepaid.addGestureRecognizer(tapGestureRecognizer)
        mainscrollview.contentSize = CGSize(width: 400, height: 2300)
        

    }
    func capture(){
        view.backgroundColor = UIColor.black
                captureSession = AVCaptureSession()

                guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
                let videoInput: AVCaptureDeviceInput

                do {
                    videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
                } catch {
                    return
                }

                if (captureSession.canAddInput(videoInput)) {
                    captureSession.addInput(videoInput)
                } else {
                    failed()
                    return
                }

                let metadataOutput = AVCaptureMetadataOutput()

                if (captureSession.canAddOutput(metadataOutput)) {
                    captureSession.addOutput(metadataOutput)

                    metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                    metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
                } else {
                    failed()
                    return
                }

                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.layer.bounds
                previewLayer.videoGravity = .resizeAspectFill
                view.layer.addSublayer(previewLayer)

                captureSession.startRunning()
    }

    func failed() {
           let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "OK", style: .default))
           present(ac, animated: true)
           captureSession = nil
       }

       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

           if (captureSession?.isRunning == false) {
               captureSession.startRunning()
           }
       }

       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)

           if (captureSession?.isRunning == true) {
               captureSession.stopRunning()
           }
       }

       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

       func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
           captureSession.stopRunning()

           if let metadataObject = metadataObjects.first {
               guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
               guard let stringValue = readableObject.stringValue else { return }
               AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
               found(code: stringValue)
           }

           dismiss(animated: true)
       }

       func found(code: String) {
           print(code)
       }

       override var prefersStatusBarHidden: Bool {
           return true
       }

       override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }


   
    
    @objc func cellTappedMethod(_ sender:AnyObject){
         print("you tap image number: \(sender.view.tag)")
        self.capture()
    
}
}
extension ForshellPayViewController: UICollectionViewDataSource {
    /// 1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == forpaycollectionview {
            return images.count
        }
        else if collectionView == Insurancecollectionview{
            return Thirdimages.count
        }
        else{
            return secodimages.count
        }
       
        
        
    }

    /// 2
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == forpaycollectionview {
        
            let cell = self.forpaycollectionview.dequeueReusableCell(withReuseIdentifier: "ForshellPayCollectionViewCell", for: indexPath)as!ForshellPayCollectionViewCell

        cell.label.text = self.names[indexPath.item]
        let myCellImage = UIImage(named: images[indexPath.item])

            cell.imageview.image = myCellImage
            return cell
            
        }
        else if collectionView == Insurancecollectionview{
            
            let cell = self.Insurancecollectionview.dequeueReusableCell(withReuseIdentifier: "InsuranceCollectionViewCell", for: indexPath)as!InsuranceCollectionViewCell

        cell.label.text = self.seocndnames[indexPath.item]
        let myCellImage = UIImage(named: Thirdimages[indexPath.item])

            cell.iamgeview.image = myCellImage
            return cell
        }
        else{
            let cell = self.seondcollectionview.dequeueReusableCell(withReuseIdentifier: "ForshellsecondCollectionViewCell", for: indexPath)as!ForshellsecondCollectionViewCell

        let myCellImage = UIImage(named: secodimages[indexPath.item])

            cell.iamgeview.image = myCellImage
            return cell
        }
        
       
    }
}
extension ForshellPayViewController: UICollectionViewDelegateFlowLayout {
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
        if collectionView == forpaycollectionview {
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 4 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 200)
        }
        else if  collectionView == Insurancecollectionview{
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 5 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 200)
        }
        else{
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            /// 5
            let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
            /// 6
            return CGSize(width: widthPerItem - 8, height: 200)
        }
      
        
        
      
    }
}
