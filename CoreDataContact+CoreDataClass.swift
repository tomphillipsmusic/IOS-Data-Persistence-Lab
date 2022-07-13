//
//  CoreDataContact+CoreDataClass.swift
//  Contacts
//
//  Created by Tyler Lawrence on 7/13/22.
//
//

import Foundation
import CoreData

@objc(CoreDataContact)
public class CoreDataContact: NSManagedObject {

    
    convenience init(contact: Contact, context: NSManagedObjectContext){
        self.init(context: context)
        self.id = contact.id
        self.firstName = contact.firstName
        self.lastName = contact.lastName
        self.company = contact.company
        self.phoneNumber = contact.phoneNumber
        self.emailAddress = contact.emailAddress
    }
}
