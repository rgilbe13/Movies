//
//  MovieMO+CoreDataProperties.swift
//  Movies
//
//  Created by Rob Gilbert on 8/27/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import Foundation
import CoreData


extension MovieMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieMO> {
        return NSFetchRequest<MovieMO>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var genre: String?
    @NSManaged public var name: String?
    @NSManaged public var rating: String?
    @NSManaged public var year: String?

}
