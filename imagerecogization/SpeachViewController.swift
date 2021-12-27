//
//  SpeachViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 24/12/21.
//

import UIKit
import Speech
class SpeachViewController: UIViewController {

    @IBOutlet var myspeachview: UIView!
    @IBOutlet var speachlabel: UILabel!
    @IBOutlet var speachview: UIView!
    @IBOutlet var start: UIButton!
    
    let audioEngine = AVAudioEngine()
      let speechReconizer : SFSpeechRecognizer? = SFSpeechRecognizer()
      let request = SFSpeechAudioBufferRecognitionRequest()
      var task : SFSpeechRecognitionTask!
      var isStart : Bool = false
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    @IBAction func speachbutton(_ sender: UIButton) {
        
        startSpeechRecognization()
    }
    func startSpeechRecognization(){
            let node = audioEngine.inputNode
            let recordingFormat = node.outputFormat(forBus: 0)
            
            node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
                self.request.append(buffer)
            }
            
            audioEngine.prepare()
            do {
                try audioEngine.start()
            } catch let error {
//                alertView(message: "Error comes here for starting the audio listner =\(error.localizedDescription)")
            }
            
            guard let myRecognization = SFSpeechRecognizer() else {
                //self.alertView(message: "Recognization is not allow on your local")
                return
            }
            
            if !myRecognization.isAvailable {
              //  self.alertView(message: "Recognization is free right now, Please try again after some time.")
            }
            
            task = speechReconizer?.recognitionTask(with: request, resultHandler: { (response, error) in
                guard let response = response else {
                    if error != nil {
                       // self.alertView(message: error.debugDescription)
                    }else {
                        //self.alertView(message: "Problem in giving the response")
                    }
                    return
                }
                
                let message = response.bestTranscription.formattedString
                print("Message : \(message)")
                self.speachlabel.text = message
                
                
                var lastString: String = ""
                for segment in response.bestTranscription.segments {
                    let indexTo = message.index(message.startIndex, offsetBy: segment.substringRange.location)
                    lastString = String(message[indexTo...])
                }
                
                if lastString == "red" {
                    self.speachview.backgroundColor = .systemRed
                } else if lastString.elementsEqual("green") {
                    self.speachview.backgroundColor = .systemGreen
                } else if lastString.elementsEqual("pink") {
                    self.speachview.backgroundColor = .systemPink
                } else if lastString.elementsEqual("blue") {
                    self.speachview.backgroundColor = .systemBlue
                } else if lastString.elementsEqual("black") {
                    self.speachview.backgroundColor = .black
                }
                
                
            })
        }
    func cancelSpeechRecognization() {
            task.finish()
            task.cancel()
            task = nil
            
            request.endAudio()
            audioEngine.stop()
            //audioEngine.inputNode.removeTap(onBus: 0)
            
            //MARK: UPDATED
            if audioEngine.inputNode.numberOfInputs > 0 {
                audioEngine.inputNode.removeTap(onBus: 0)
            }
        }

}
