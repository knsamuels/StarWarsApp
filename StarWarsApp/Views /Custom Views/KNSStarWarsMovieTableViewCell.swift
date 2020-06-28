//
//  KNSStarWarsMovieTableViewCell.swift
//  StarWarsApp
//
//  Created by Kristin Samuels  on 6/26/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit

class KNSStarWarsMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDirectorLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    
    var movie: KNSMovie? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        if let newMovie = movie {
            movieTitleLabel.text = newMovie.title
            movieDirectorLabel.text = newMovie.director
            movieReleaseDateLabel.text = newMovie.dateReleased
        }
    }
}
