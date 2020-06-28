//
//  KNSStarWarsMovieTableViewController.swift
//  StarWarsApp
//
//  Created by Kristin Samuels  on 6/26/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

import UIKit

class KNSStarWarsMovieTableViewController: UITableViewController {

    var movies: [KNSMovie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
    }

    func fetchMovies() {
        KNSMovieController.fetchMovies { (movies) in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? KNSStarWarsMovieTableViewCell else {return UITableViewCell()}
        let newMovie = movies[indexPath.row]
        cell.movie = newMovie
        return cell
    }
}

