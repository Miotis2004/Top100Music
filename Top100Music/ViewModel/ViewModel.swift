//
//  ViewModel.swift
//  Top100Music
//
//  Created by Field Employee on 11/6/20.
//

import Foundation

class ViewModel {
    
    var manager: CoreDataManager
    
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
