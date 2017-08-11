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
    
    
    func toJSON() -> Dictionary<String, Any> {
        var JSONObjectArray: [String: Any] = [:]
        var count: Int = 0;
        for movie in moviesArray {
            JSONObjectArray[String(count)] = movie.toJSON()
            count = count + 1
        }
        return JSONObjectArray
    }
    
    func storeMovieArray() {
        let data = JSONSerialization.isValidJSONObject(toJSON()) // true
        let fileManager = FileManager.default
        do {
            let data = try JSONSerialization.data(withJSONObject: toJSON(), options: .prettyPrinted) as Data
           // print(data as! String)
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("movies")
            
            print(fileURL)
            sleep(10)
            try data.write(to: fileURL)
        } catch {
            
        }
        //let data = NSKeyedArchiver.archivedData(withRootObject: moviesArray)
    }
    
    init() {
        self.loadFromFileManager(fileManager: FileManager.default)
    }
    
    func loadFromFileManager(fileManager:FileManager) {
    //let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("movies")
            let storedArray = try Data(contentsOf: fileURL)
            moviesArray = (NSKeyedUnarchiver.unarchiveObject(with: storedArray as Data) as? [Movie])!
            //sleep(5)
        } catch {
        print(error)
    }
}
}
