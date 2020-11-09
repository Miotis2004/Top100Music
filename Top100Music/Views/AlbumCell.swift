//
//  AlbumCell.swift
//  Top100Music
//
//  Created by Field Employee on 11/5/20.
//

import UIKit
import CoreData

class AlbumCell: UITableViewCell {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var isFavorite: Bool?
    var deselectedHeart: String = "🤍"
    var selectedHeart: String = "❤️"
    
    var imageUrl: String?
    var albumName: String?
    var artistName: String?
    var releaseDate: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if isFavorite ?? false {
            heartButton.setTitle(selectedHeart, for: .normal)
        } else {
            heartButton.setTitle(deselectedHeart, for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func heartButtonTap(_ sender: UIButton) {
//        isFavorite!.toggle()
//        
//        if isFavorite! {
//            heartButton.setTitle(selectedHeart, for: .normal)
//        } else {
//            heartButton.setTitle(deselectedHeart, for: .normal)
//        }
    
//        let coder = Results()
//        coder.albumName = albumName!
//        coder.artworkUrl100 = imageUrl!
//        coder.artistName = artistName!
//        coder.releaseDate = releaseDate!
        //coder.isFavorite = isFavorite!
        
        //ViewModel.shared.save(toSave: coder)
        

        
    }
}
