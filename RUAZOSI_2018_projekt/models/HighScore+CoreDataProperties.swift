//
//  HighScore+CoreDataProperties.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 06/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//
//

import Foundation
import CoreData


extension HighScore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HighScore> {
        return NSFetchRequest<HighScore>(entityName: "HighScore")
    }

    @NSManaged public var score: Double
    @NSManaged public var appUser: AppUser?

}
