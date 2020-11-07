//
//  AlbumCell.swift
//  Top100Music
//
//  Created by Field Employee on 11/5/20.
//

import UIKit
import CoreData

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var isFavorite: Bool = false
    var deselectedHeart: String = "🤍"
    var selectedHeart: String = "❤️"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if isFavorite {
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
        isFavorite.toggle()
        
        if isFavorite {
            heartButton.setTitle(selectedHeart, for: .normal)
        } else {
            heartButton.setTitle(deselectedHeart, for: .normal)
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let albumEntity = NSEntityDescription.entity(forEntityName: "AlbumData", in: managedContext) else {return}
        
        var album = NSManagedObject(entity: albumEntity, insertInto: managedContext)
        album.setValue(isFavorite, forKeyPath: "isFavorite")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Did not save favorite")
        }
        
    }
}
