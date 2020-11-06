//
//  NetworkManager.swift
//  Top100Music
//
//  Created by Field Employee on 11/6/20.
//

import UIKit

final class NetworkManager {
    static var shared = NetworkManager()
    
    let session = URLSession(configuration: .default)
    var myUrl = ""
    
    private init() {
        
    }
}

extension NetworkManager {
    
    func loadAlbumData() {
        
    }
    
}
