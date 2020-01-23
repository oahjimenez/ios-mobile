//
//  CreditCard+CoreDataProperties.swift
//  DataModelSample
//
//  Created by user164457 on 1/22/20.
//  Copyright © 2020 user164457. All rights reserved.
//
//

import Foundation
import CoreData


extension CreditCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreditCard> {
        return NSFetchRequest<CreditCard>(entityName: "CreditCard")
    }

    @NSManaged public var number: Int64
    @NSManaged public var type: String?
    @NSManaged public var cvc: String?
    @NSManaged public var expirationDate: Date?
    @NSManaged public var persons: Person?

}
