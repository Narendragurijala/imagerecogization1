//
//  MovieViewModel.swift
//  MVVMYOUTUBE
//
//  Created by Yogesh Patel on 10/03/19.
//  Copyright © 2019 Yogesh Patel. All rights reserved.
//

import UIKit

class MYMovieViewModel: NSObject {

    var artistName: String?
    var trackName: String?
    
   // D I
    
    init(movie:MyMovieModel){
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
    
}
