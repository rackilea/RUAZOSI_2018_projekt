//
//  AppUser+CoreDataProperties.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 06/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//
//

import Foundation
import CoreData


extension AppUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppUser> {
        return NSFetchRequest<AppUser>(entityName: "AppUser")
    }

    @NSManaged public var username: String?
    @NSManaged public var scores: NSSet?

}

// MARK: Generated accessors for scores
extension AppUser {

    @objc(addScoresObject:)
    @NSManaged public func addToScores(_ value: HighScore)

    @objc(removeScoresObject:)
    @NSManaged public func removeFromScores(_ value: HighScore)

    @objc(addScores:)
    @NSManaged public func addToScores(_ values: NSSet)

    @objc(removeScores:)
    @NSManaged public func removeFromScores(_ values: NSSet)

}
