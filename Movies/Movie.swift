//
//  Movie.swift
//  Movies
//
//  Created by Rob Gilbert on 8/3/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import Foundation

class Movie {
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
}
