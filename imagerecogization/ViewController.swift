//
//  SceneDelegate.swift
//  imagerecogization
//
//  Created by Rahul Singh on 26/10/21.
//

import UIKit
import Vision
import VisionKit
import PDFKit
//import GoogleMaps
class ViewController: UIViewController, UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    private var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)
    var imagePicker = UIImagePickerController()

    @IBOutlet var activateindicatorview: UIActivityIndicatorView!
    
    @IBOutlet var ocrtext: UITextView!
    
    @IBOutlet var scanimage: UIImageView!
    
    var timer = Timer()
    
    var accuracy = String()
    @IBOutlet var scanbutton: UIButton!
    @IBOutlet var Camerabutton: UIButton!
    @IBOutlet var galleryview: UIView!
    
    @IBOutlet var gallerybutton: UIButton!
    var image = UIImage()
    
    
    @IBOutlet var dropdownView: UIView!
    @IBOutlet var dropdowntabelView: UITableView!
    
    @IBOutlet var dropdownbutton: UIButton!
    @IBOutlet var pdf: UIButton!
    
    let pdfs: [String] = ["I-20-sample", "sample", "GetStartedWithSmallpdf"]
    let cellReuseIdentifier = "cell"
       var pdfName = String()
    
    
    
    @IBOutlet var imageTabelview: UITableView!
    
    
    var logoImages: [UIImage] = []

    
    @IBOutlet var multipdftabelview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dropdowntabelView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        self.multipdftabelview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        imagePicker.delegate = self
        activateindicatorview.isHidden = true
        ocrtext.delegate = self
        ocrtext.layer.cornerRadius = 7.0
        ocrtext.layer.borderWidth = 1.0
        ocrtext.layer.borderColor = UIColor.systemTeal.cgColor
        
        
        scanimage.layer.cornerRadius = 7.0
        scanimage.layer.borderWidth = 1.0
        scanimage.layer.borderColor = UIColor.systemIndigo.cgColor
        scanimage.backgroundColor = UIColor.init(white: 1.0, alpha: 0.1)
        
        galleryview.layer.cornerRadius = 7.0
        galleryview.layer.borderWidth = 1.0
        galleryview.layer.borderColor = UIColor.systemIndigo.cgColor
        galleryview.backgroundColor = UIColor.init(white: 1.0, alpha: 0.1)
        
        Camerabutton.layer.cornerRadius = 7.0
        Camerabutton.layer.borderWidth = 1.0
        gallerybutton.layer.cornerRadius = 7.0
        gallerybutton.layer.borderWidth = 1.0
        
        dropdowntabelView.layer.cornerRadius = 7.0
        dropdowntabelView.layer.borderWidth = 1.0
        dropdowntabelView.layer.cornerRadius = 7.0
        dropdowntabelView.layer.borderWidth = 1.0
        
        
        scanbutton.layer.cornerRadius = 7.0
        scanbutton.layer.borderWidth = 1.0
        
        configureOCR()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == imageTabelview {
            return self.logoImages.count
        }else{
            return self.pdfs.count
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == imageTabelview {
            let cell = imageTabelview.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.cellimage.image = self.logoImages[indexPath.row]
            cell.cellimage.contentMode = .scaleToFill
        return cell
            
        }else{
            let cell:UITableViewCell = (self.multipdftabelview.dequeueReusableCell(withIdentifier: cellReuseIdentifier))!
                cell.textLabel?.text = self.pdfs[indexPath.row]
                return cell
        }
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if tableView == imageTabelview {
        return 375 // the height you want
      } else {
        return 100
      }
    }
    
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView  == multipdftabelview {
            self.ocrtext.text = ""
            
            self.multipdftabelview.isHidden = true
        self.dropdownView.isHidden = true
            self.galleryview.isHidden = true

            activateindicatorview.isHidden = false
            activateindicatorview.startAnimating()
           pdfName = self.pdfs[indexPath.row]
    //        self.pdf.isHidden = true
    //       // timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
           self.multipdf()
        }
     
      
    }
    
    
    func multipdf(){
        guard let path = Bundle.main.path(forResource:pdfName, ofType:"pdf") else { return }
        let url = URL(fileURLWithPath: path)
        guard let document = PDFDocument(url: url) else { return }
        
        if let url = Bundle.main.url(forResource: pdfName, withExtension: "pdf"),
                let pdf = CGPDFDocument(url as CFURL) {
                let count = pdf.numberOfPages
                print(count)
            
            let myGroup = DispatchGroup()
            DispatchQueue.main.async {
                for i in 0 ..< count{
                    print(i)
                    myGroup.enter()

                            guard let page = document.page(at: i) else { return }
                            let pageRect = page.bounds(for: .mediaBox)
                            let renderer = UIGraphicsImageRenderer(size: pageRect.size)
                            let img = renderer.image { ctx in
                                UIColor.white.set()
                                ctx.fill(CGRect(x: 0, y: 0, width: pageRect.width, height: pageRect.height))
                                ctx.cgContext.translateBy(x: -pageRect.origin.x, y: pageRect.size.height - pageRect.origin.y)
                                ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
                                page.draw(with: .mediaBox, to: ctx.cgContext)
                            }
                       myGroup.leave()
                    self.scanimage.image = img
                    self.logoImages.append(img)
                        self.processImage(img)
                     


                }
            }
      
            myGroup.notify(queue: .main) {
                   print("Finished all requests.")
               }
            DispatchQueue.main.async {
                self.imageTabelview.isHidden = false
                self.imageTabelview.reloadData()
            }
            print("logoimages",self.logoImages)
            print("logoimages",self.logoImages.count)
        }
        
    }
    
    @IBAction func gallery(_ sender: Any) {
        
        activateindicatorview.isHidden = false
        activateindicatorview.startAnimating()
                       
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
                       }
    }
    
    
    @IBAction func dropdownaction(_ sender: UIButton) {
        self.dropdowntabelView.isHidden = false
    }
    
    @IBAction func camera(_ sender: Any) {
        activateindicatorview.isHidden = false
        activateindicatorview.startAnimating()

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            
            }
        else{
            activateindicatorview.isHidden = true
            activateindicatorview.stopAnimating()
            
            let alert = UIAlertController(title: "My Title", message: "Simulator no camera Option", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func pdf(_ sender: UIButton) {
        self.scanimage.image = nil
        self.ocrtext.text = ""
        accuracy = ""
        self.pdf.isHidden = true
        self.dropdownView.isHidden = false
        self.pdf.isEnabled = false
    }
    
    
    
    @IBAction func scanbutton(_ sender: Any) {
        if accuracy == "imageoption" {
            activateindicatorview.isHidden = false
            activateindicatorview.startAnimating()
            processImage(self.image)
        }
        else{
            activateindicatorview.isHidden = false
            activateindicatorview.startAnimating()
            
//            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            
            
            
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            ocrtext.resignFirstResponder()
            return false
        }
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            scanimage.image = image
                self.image = image
                self.galleryview.isHidden = true
                activateindicatorview.isHidden = true
                activateindicatorview.stopAnimating()
                accuracy = "imageoption"
            }

        }
    
    

    @objc func timerAction() {
        self.pdf.isHidden = true
        
        guard let path = Bundle.main.path(forResource:pdfName, ofType:"pdf") else { return }
        let url = URL(fileURLWithPath: path)
        guard let document = PDFDocument(url: url) else { return }
       
        guard let page = document.page(at: 0) else { return }
        let pageRect = page.bounds(for: .mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(CGRect(x: 0, y: 0, width: pageRect.width, height: pageRect.height))
            ctx.cgContext.translateBy(x: -pageRect.origin.x, y: pageRect.size.height - pageRect.origin.y)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            page.draw(with: .mediaBox, to: ctx.cgContext)
        }

       scanimage.image = img

        processImage(img)

        }
    private func processImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
         self.ocrtext.text = ""
        scanbutton.isEnabled = false
        activateindicatorview.isHidden = true
        activateindicatorview.stopAnimating()
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try requestHandler.perform([self.ocrRequest])
        } catch {
            print(error)
        }
    }

    
    private func configureOCR() {
        
        var ocrText = ""
        ocrRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
           
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                
                ocrText += topCandidate.string + "\n"
            }
            
            DispatchQueue.main.async { [self] in
              self.ocrtext.text = ocrText
                self.scanbutton.isEnabled = true
                self.pdf.isHidden = false
            }
        }
        
        ocrRequest.recognitionLevel = .accurate
        ocrRequest.recognitionLanguages = ["en-US", "en-GB"]

        ocrRequest.usesLanguageCorrection = true
    }
}



