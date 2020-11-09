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
    var formattedDate: String?
    
    //let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeDate()

        albumnameLabel.text = albumName
        artistNameLabel.text = artistName
        dateLabel.text = "Release date: \(formattedDate!)"
        albumArtImageView.sd_setImage(with: URL(string: imageUrl!), completed: nil)
        
//        if isFavorite! {
//            favoriteButton.setTitle("❤️", for: .normal)
//        } else {
//            favoriteButton.setTitle("🤍", for: .normal)
//        }
    }
    
    @IBAction func favoriteButtonTap(_ sender: Any) {
//        isFavorite?.toggle()
//        
//        if isFavorite! {
//            favoriteButton.setTitle("❤️", for: .normal)
//        } else {
//            favoriteButton.setTitle("🤍", for: .normal)
//        }
        
//        let coder = CodeResults()
//        coder.albumName = albumName!
//        coder.artworkUrl100 = imageUrl!
//        coder.artistName = artistName!
//        coder.releaseDate = releaseDate!
//        coder.isFavorite = isFavorite!
//        
//        ViewModel.shared.save(toSave: coder)
    }
    
    func makeDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let datetime = formatter.date(from: releaseDate!)
        formatter.dateStyle = .medium
        print(datetime)
        if datetime != nil {
            formattedDate = formatter.string(from: datetime!)
        } else {
            formattedDate = "No date available"
        }
        
        
    }
}
