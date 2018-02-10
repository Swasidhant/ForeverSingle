//
//  Advantages+CoreDataProperties.swift
//  ForeverSingle
//
//  Created by Swasidhant Chowdhury on 09/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//
//

import Foundation
import CoreData


extension Advantages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Advantages> {
        return NSFetchRequest<Advantages>(entityName: "Advantages")
    }

    @NSManaged public var desc: String?

}
