//
//  Movie.swift
//  Movies
//
//  Created by Rob Gilbert on 8/3/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import Foundation

class Movie: NSObject, NSCoding {
    var name: String?
    var year: String?
    var director: String?
    var rating: String?
    var genre: String?
    
    
    init(name n: String, year y: String, director d: String, rating r: String, genre g: String) {
        name = n
        year = y
        director = d
        rating = r
        genre = g
    }
    required init?(coder aDecoder: NSCoder) {
        if let s = aDecoder.decodeObject(forKey: "name") as?
            String {
            name = s
        }
        if let s = aDecoder.decodeObject(forKey: "year") as?
            String {
            year = s
        }
        if let s = aDecoder.decodeObject(forKey: "director") as?
            String {
            director = s
        }
        if let s = aDecoder.decodeObject(forKey: "rating") as?
            String {
            rating = s
        }
        if let s = aDecoder.decodeObject(forKey: "genre") as?
            String {
            genre = s
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(year, forKey: "year")
        aCoder.encode(director, forKey: "director")
        aCoder.encode(rating, forKey: "rating")
        aCoder.encode(genre, forKey: "genre")
    }
    
    func toJSON() -> Dictionary<String, Any> {
        let JSONObject: [String:Any] = [
            "name" : name as Any,
            "year" : year as Any,
            "director" : director as Any,
            "rating" : rating as Any,
            "genre" : genre as Any
        ]
        
        return JSONObject
    }
    
    
}
