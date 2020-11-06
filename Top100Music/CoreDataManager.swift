//
//  CoreDataManager.swift
//  Top100Music
//
//  Created by Field Employee on 11/6/20.
//

import Foundation
import CoreData

class CoreDataManager {
    
    lazy var persitentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Top100Music")
            
            container.loadPersistentStores { (description, error) in
                if let error = error {
                    fatalError("Something went very wrong")
                }
            }
            return container
        }()
        
        func saveContext() {
            let context = self.persitentContainer.viewContext

            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    fatalError("Something went very wrong saving data \(error.localizedDescription)")
                }
            }
        }
    
}

extension CoreDataManager {
    
    func fetchAlbum()  -> AlbumData? {
            let context = self.persitentContainer.viewContext
            
            let request: NSFetchRequest<AlbumData> = AlbumData.fetchRequest()
            do {
                let results = try context.fetch(request)
                if let album = results.first {
                    return album
                }
            } catch {
                print("Oops!")
            }
            return nil
        }
    
}
