//
//  LoginPresenter.swift  LoginPresenter.swift
//  imagerecogization
//
//  Created by Rahul Singh on 03/01/22.
//

import Foundation
  
  
protocol PresenterView:class {
    func updateLoginUI()
}
class LoginPresenter{
    weak var presenterView:PresenterView?
    var userName:String?
    var password:String?
      
    init(view:PresenterView){
        self.presenterView = view
    }
      
    func submitButtonClicked(){
        if(self.userName == "root" && self.password == "root"){
            let userModel = UserModelfinal(name:self.userName, password:password)
            self.presenterView?.updateLoginUI()
        }
    }
}  
