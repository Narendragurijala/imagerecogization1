//
//  MovieModel.swift
//  MVVMYOUTUBE
//
//  Created by Yogesh Patel on 10/03/19.
//  Copyright © 2019 Yogesh Patel. All rights reserved.
//

import UIKit

class MovieModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    init(artistName:String, trackName: String){
        self.artistName = artistName
        self.trackName = trackName
    }
}


class ResultsModel: Decodable {
    
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
    
}
