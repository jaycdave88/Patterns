//
//  Pattern.swift
//  
//
//  Created by DEV MODE on 6/24/15.
//
//

import Foundation
import CoreData

class Pattern: NSManagedObject {

    @NSManaged var backImage: NSData
    @NSManaged var frontImage: NSData
    @NSManaged var name: String

}
