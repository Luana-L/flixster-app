//
//  DetailViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/5/22.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var avgNumLabel: UILabel!
    @IBOutlet weak var voteNumLabel: UILabel!
    @IBOutlet weak var popNumLabel: UILabel!
    @IBOutlet weak var movieDescripLabel: UILabel!
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieBackdropURL = URL(string:"https://image.tmdb.org/t/p/original/"+movie.backdrop_path)!
        
        Nuke.loadImage(with: movieBackdropURL, into: movieImageView)
        
        movieTitle.text = movie.original_title
        movieDescripLabel.text = movie.overview
        avgNumLabel.text = String(movie.vote_average)
        voteNumLabel.text = String(movie.vote_count)
        popNumLabel.text = String(movie.popularity)

    }



}
