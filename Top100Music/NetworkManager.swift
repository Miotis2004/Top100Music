//
//  NetworkManager.swift
//  Top100Music
//
//  Created by Field Employee on 11/6/20.
//

import UIKit

final class NetworkManager {
    static var shared = NetworkManager()
    
    let session: URLSession
    var myUrl = ""
    
    var albumArray = [Album]()
    
    private init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension NetworkManager {
    
    func loadAlbumList() -> [Album]?{
        
        guard let url = URL(string: "https://rss/itunes.apple.com/api/v1/us/apple-music/top-songs/all/100/explicit.json") else {
            print("URL guard statement failed")
            return nil
        }
        
        URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
            guard let self = self else {return}
            
            if let data = data {
                guard let album = try? JSONDecoder().decode(Album.self, from: data) else {
                    print("Error decoding data")
                    return
                }
                self.albumArray.append(album)
            }
            
        }.resume()
        return albumArray
    }
    
}
