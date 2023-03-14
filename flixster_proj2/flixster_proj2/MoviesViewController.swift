//
//  ViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/1/22.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell
            
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        tableView.dataSource = self
        
        // Create a URL for the request
        // In this case, the custom search URL you created in in part 1
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=794a8009276590ae188b930b43222ecf")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)

        // Create a URLSession using a shared instance and call its dataTask method
        // The data task method attempts to retrieve the contents of a URL based on the specified URL.
        // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
            // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
            do {
                
                // Use the JSON decoder to try and map the data to our custom model.
                let decoder = JSONDecoder()
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(MoviesResponse.self, from: data)
                
                // Access the array of tracks from the `results` property
                let movies = response.results
                
                // Execute UI updates on the main thread when calling from a background callback
                DispatchQueue.main.async {
                    
                    // Set the view controller's tracks property as this is the one the table view references
                    self?.movies = movies
                    
                    // Make the table view reload now that we have new data
                    self?.tableView.reloadData()
                }
                
                print("✅ \(movies)")
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()
        
        
        print(movies)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        if let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let detailViewController = segue.destination as? DetailViewController {
                let movie = movies[indexPath.row]
                detailViewController.movie = movie
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    

}
