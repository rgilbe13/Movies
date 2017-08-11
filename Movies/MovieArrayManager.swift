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
    
    func dicToMoviesArray(dic: Dictionary<String, Any>) -> [Movie] {
        var name: String = ""
        var year: String = ""
        var rating: String = ""
        var director: String = ""
        var genre: String = ""
        for (num, movie) in dic {
            for (label, value) in movie as! Dictionary<String, Any> {
                switch label
                {
                    case "name":
                        name = value as! String
                        break
                    case "year":
                        year = value as! String
                        break
                    case "director":
                        director = value as! String
                        break
                    case "rating":
                        rating = value as! String
                        break
                    case "genre":
                        genre = value as! String
                        break
                    default:
                        break
                }
            }
            let tempMovie = Movie(name: name, year: year, director: director, rating: rating, genre: genre)
            moviesArray.append(tempMovie)
        }
        return []
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
    let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("movies")
            let json = try Data(contentsOf: fileURL)
            let dic = try JSONSerialization.jsonObject(with: json)
            let temp = dicToMoviesArray(dic: dic as! Dictionary<String, Any>)
            //sleep(5)
        } catch {
        print(error)
    }
}
}
