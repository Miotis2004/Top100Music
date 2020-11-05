//
//  MainViewController.swift
//  Top100Music
//
//  Created by Field Employee on 11/5/20.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        
        cell.albumNameLabel.text = "Album name goes here"
        cell.artistNameLabel.text = "Artist name goes here"
        cell.albumImage.image = UIImage(named: "DarkKnight")
        
        return cell
    }
    

}
