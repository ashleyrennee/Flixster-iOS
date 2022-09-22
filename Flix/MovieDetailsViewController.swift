//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Ashley Acevedo on 9/21/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backdropImageView.layer.borderWidth = 1
        backdropImageView.layer.borderColor = UIColor.darkGray.cgColor
        posterImageView.layer.borderWidth = 1
        posterImageView.layer.masksToBounds = false
        posterImageView.layer.borderColor = UIColor.white.cgColor
        posterImageView.layer.cornerRadius = posterImageView.frame.height/2
        posterImageView.clipsToBounds = true
        
        titleLabel.text = movie["title"] as? String
    
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        
        let posterPath = movie["poster_path"] as! String
        
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterImageView.af.setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropImageView.af.setImage(withURL: backdropUrl!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
