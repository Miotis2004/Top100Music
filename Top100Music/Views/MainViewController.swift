//
//  MainViewController.swift
//  Top100Music
//
//  Created by Field Employee on 11/5/20.
//

import UIKit
import Alamofire
import CoreData
import SDWebImage

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    var albumArray: [Album] = [Album]()
    var albumsData: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        retrieveFromCoreData()
        
        if albumsData.count == 0 {
            viewModel.fetchAlbums()
            retrieveFromCoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        
        let album = albumsData[indexPath.row]
        cell.albumNameLabel.text = album.value(forKeyPath: "albumName") as? String
        cell.artistNameLabel.text = album.value(forKeyPath: "artistName") as? String
        let imageString: String = album.value(forKeyPath: "artUrl") as? String ?? ""
        cell.albumImage.sd_setImage(with: URL(string: imageString), completed: nil)
        
        return cell
    }
    
func retrieveFromCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AlbumData")
        
        do {
            albumsData = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Loading API data...")
        }
    }
}
