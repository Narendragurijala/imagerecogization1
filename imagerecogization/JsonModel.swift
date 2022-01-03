//
//  JsonModel.swift
//  swiftyjson
//
//  Created by Yogesh Patel on 16/04/18.
//  Copyright © 2018 Yogesh Patel. All rights reserved.
//

import Foundation
import SwiftyJSON
import Kingfisher
struct JsonModel{
    var artistName: String = ""
    var trackCensoredName: String = ""
    var artworkUrl100: String = ""
    init(){
        
    }
    
    init(json:JSON){
        artistName = json["artistName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
    }
}
