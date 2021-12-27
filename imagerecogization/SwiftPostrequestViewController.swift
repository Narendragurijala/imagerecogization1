//
//  SwiftPostrequestViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 23/12/21.
//

import UIKit

class SwiftPostrequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.PostMethodWithparameters()
    }
   
    func PostMethodWithparameters(){
        
        let params = ["username":"john", "password":"123456"] as Dictionary<String, String>

        var request = URLRequest(url: URL(string: "http://localhost:8080/api/1/login")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
    
    func getReuest(){
        
        
    }
}
