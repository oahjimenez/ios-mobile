//
//  Person+CoreDataProperties.swift
//  DataModelSample
//
//  Created by user164457 on 1/22/20.
//  Copyright © 2020 user164457. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var rut: String?
    @NSManaged public var name: String?
    @NSManaged public var birthDate: Date?
    @NSManaged public var age: Int16
    @NSManaged public var creditCards: NSSet?

}

// MARK: Generated accessors for creditCards
extension Person {

    @objc(addCreditCardsObject:)
    @NSManaged public func addToCreditCards(_ value: CreditCard)

    @objc(removeCreditCardsObject:)
    @NSManaged public func removeFromCreditCards(_ value: CreditCard)

    @objc(addCreditCards:)
    @NSManaged public func addToCreditCards(_ values: NSSet)

    @objc(removeCreditCards:)
    @NSManaged public func removeFromCreditCards(_ values: NSSet)

}
