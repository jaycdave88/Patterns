//
//  Pattern.swift
//  Patterns
//
//  Created by DEV MODE on 6/24/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import Foundation
import CoreData

class Pattern: NSManagedObject {

    @NSManaged var backImage: NSData
    @NSManaged var frontImage: NSData
    @NSManaged var name: String

}
