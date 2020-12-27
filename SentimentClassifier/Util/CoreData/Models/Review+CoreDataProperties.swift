//
//  Review+CoreDataProperties.swift
//  
//
//  Created by Ivana Mršić on 27.12.2020..
//
//

import Foundation
import CoreData

extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var movieTitle: String?
    @NSManaged public var movieYear: String?
    @NSManaged public var reviewTitle: String?
    @NSManaged public var reviewText: String?
    @NSManaged public var reviewDate: String?
    @NSManaged public var sentiment: String?

}
