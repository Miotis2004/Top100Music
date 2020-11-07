//
//  Album.swift
//  Top100Music
//
//  Created by Field Employee on 11/5/20.
//

import Foundation

struct Album: Codable {
    var feed: Details
}

struct Details: Codable {
    var results: [Results]
}

struct Results: Codable {
    var artistName: String
    var albumName: String
    var artworkUrl100: String
    var releaseDate: String
    //var genres: [Genres]
    
    enum CodingKeys: String, CodingKey {
        case albumName = "name"
        case artistName, artworkUrl100, releaseDate
    }
}



//struct Genres: Codable {
//    var genreName: String
//
//    enum CodingKeys: String, CodingKey {
//        case genreName = "name"
//    }
//}
