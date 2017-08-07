//
//  MovieArrayManager.swift
//  Movies
//
//  Created by Rob Gilbert on 8/6/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import Foundation

class MovieArrayManager {
    var moviesArray: [Movie] = []
    
    func storeMovieArray() {
        let defaults = UserDefaults.standard
        let data = NSKeyedArchiver.archivedData(withRootObject: moviesArray)
        defaults.set(data, forKey: "stored_movie_data")
        defaults.synchronize()
    }
    
    init() {
        if let storedArray = UserDefaults.standard.object(forKey: "stored_movie_data")  as? NSData {
            moviesArray = (NSKeyedUnarchiver.unarchiveObject(with: storedArray as Data) as? [Movie])!
        }
    }
}
