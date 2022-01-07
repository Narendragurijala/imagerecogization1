//
//  MovieModel.swift
//  MVVMYOUTUBE
//
//  Created by Yogesh Patel on 10/03/19.
//  Copyright © 2019 Yogesh Patel. All rights reserved.
//

import UIKit

class MyMovieModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    init(artistName:String, trackName: String){
        self.artistName = artistName
        self.trackName = trackName
    }
}


class ResultsModel1: Decodable {
    
    var results = [MyMovieModel]()
    
    init(results: [MyMovieModel]) {
        self.results = results
    }
    
}
