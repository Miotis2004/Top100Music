//
//  ViewModel.swift
//  Top100Music
//
//  Created by Field Employee on 11/6/20.
//

import Foundation
import Alamofire
import CoreData

class ViewModel {
    
    var manager: CoreDataManager
    var albumArray: [Results]?
    var albumsData: [NSManagedObject] = []
    
    var album: AlbumData? {
        didSet {
            self.updateHandler?()
        }
    }
    
    var updateHandler: (() -> ())?
    
    init(manager: CoreDataManager = CoreDataManager()) {
        self.manager = manager
    }
    
    func bind(handler: @escaping () -> ()) {
        self.updateHandler = handler
    }
    
    
}

extension ViewModel {
    
    func fetchAlbums() {
        let request = AF.request("https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/non-explicit.json")
        
        request.responseDecodable(of: Album.self) { (response) in
            guard let albums = response.value else {return}
            
            for album in (0..<albums.feed.results.count) {
                self.save(toSave: albums.feed.results[album])
            }
        }
    }
    
    func save(toSave: Results) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "AlbumData", in: managedContext)!
        
        let result = NSManagedObject(entity: entity, insertInto: managedContext)
        
        result.setValue(toSave.artistName, forKey: "artistName")
        result.setValue(toSave.albumName, forKey: "albumName")
        result.setValue(toSave.artworkUrl100, forKey: "artUrl")
        result.setValue(toSave.releaseDate, forKey: "releaseDate")
        result.setValue(false, forKey: "isFavorite")
        
        do {
            try managedContext.save()
            albumsData.append(result)
        } catch let error as NSError {
            print("Could not save: \(error)")
        }
    }
}
