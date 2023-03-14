
import Nuke
import UIKit

class TrackCell: UITableViewCell {

    @IBOutlet weak var movieDescripLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {
        movieTitleLabel.text = movie.original_title
        movieDescripLabel.text = movie.overview

        // Load image async via Nuke library image loading helper method
        
        let moviePosterURL = URL(string:"https://image.tmdb.org/t/p/original/"+movie.poster_path)!
        
        Nuke.loadImage(with: moviePosterURL, into: movieImageView)
    }

}
