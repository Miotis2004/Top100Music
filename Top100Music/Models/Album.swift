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
    var name: String
    var artworkUrl100: String
}
