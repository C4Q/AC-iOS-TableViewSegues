//
//  MoviesViewController.swift
//  TableViewWIthSegues
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movies = [Movie]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        self.movies = MovieData.movies
    }

    // 2 Required Data source methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath)
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = String(movie.year)
        return cell
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        switch segue.identifier! {
        case "Show Detail Segue":
            if let destination = segue.destination as? MovieDetailViewController {
                destination.movie = movies[tableView.indexPathForSelectedRow!.row]
            }
        case "Button Segue":
            print("Buttons!")
        default:
            fatalError()
        }
        // Pass the selected object to the new view controller.
    }
}
