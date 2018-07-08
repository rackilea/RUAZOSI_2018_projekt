//
//  Score+CoreDataProperties.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 07/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var score: Double
    @NSManaged public var appUser: AppUser?

}
