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
        isFavorite!.toggle()
        
        if isFavorite! {
            heartButton.setTitle(selectedHeart, for: .normal)
        } else {
            heartButton.setTitle(deselectedHeart, for: .normal)
        }
        
        
//        var coder: CodeResults = CodeResults(artistName: artistName!, albumName: albumName!, artworkUrl100: imageUrl!, releaseDate: releaseDate!, isFavorite: isFavorite!)
        
        let coder = CodeResults()
        coder.albumName = albumName!
        coder.artworkUrl100 = imageUrl!
        coder.artistName = artistName!
        coder.releaseDate = releaseDate!
        coder.isFavorite = isFavorite!
        
        ViewModel.shared.save(toSave: coder)
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        guard let albumEntity = NSEntityDescription.entity(forEntityName: "AlbumData", in: managedContext) else {return}
//
//        var album = NSManagedObject(entity: albumEntity, insertInto: managedContext)
//        album.setValue(isFavorite, forKeyPath: "isFavorite")
//
//        do {
//            try managedContext.save()
//        } catch let error as NSError {
//            print("Did not save favorite")
//        }
        
    }
}
