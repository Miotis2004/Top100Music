//
//  DetailsViewController.swift
//  Top100Music
//
//  Created by Field Employee on 11/7/20.
//

import UIKit
import SDWebImage
import CoreData

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var albumnameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var imageUrl: String?
    var isFavorite: Bool?
    var albumName: String?
    var artistName: String?
    var releaseDate: String?
    
    //let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        albumnameLabel.text = albumName
        artistNameLabel.text = artistName
        dateLabel.text = "Release date: \(releaseDate!)"
        albumArtImageView.sd_setImage(with: URL(string: imageUrl!), completed: nil)
        
        if isFavorite! {
            favoriteButton.setTitle("❤️", for: .normal)
        } else {
            favoriteButton.setTitle("🤍", for: .normal)
        }
    }
    
    @IBAction func favoriteButtonTap(_ sender: Any) {
        isFavorite?.toggle()
        
        if isFavorite! {
            favoriteButton.setTitle("❤️", for: .normal)
        } else {
            favoriteButton.setTitle("🤍", for: .normal)
        }
        
        var coder: CodeResults = CodeResults(artistName: artistName!, albumName: albumName!, artworkUrl100: imageUrl!, releaseDate: releaseDate!, isFavorite: isFavorite!)
        
        ViewModel.shared.save(toSave: coder)
    }
}
