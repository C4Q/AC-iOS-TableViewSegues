//
//  MovieDetailViewController.swift
//  TableViewWIthSegues
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var summaryLabel: UITextView!
    
    var movie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {
            return
        }
        movieImageView.image = UIImage(named: movie.posterImageName)
        movieNameLabel.text = movie.name
        yearLabel.text = movie.year.description
        actorsLabel.text = movie.cast.joined(separator: ",")
        summaryLabel.text = movie.description
    }

}
