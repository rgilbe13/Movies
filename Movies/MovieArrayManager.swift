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
        let data = NSKeyedArchiver.archivedData(withRootObject: moviesArray)
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("movies")
            try data.write(to: fileURL)
        } catch {
            print(error)
        }
    }
    
    init() {
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("movies")
            let storedArray = try Data(contentsOf: fileURL)
            moviesArray = (NSKeyedUnarchiver.unarchiveObject(with: storedArray as Data) as? [Movie])!
        } catch {
            print(error)
        }
    }
}
