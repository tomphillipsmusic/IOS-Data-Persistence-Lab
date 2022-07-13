//
//  CoreDataContact+CoreDataProperties.swift
//  Contacts
//
//  Created by Tyler Lawrence on 7/13/22.
//
//

import Foundation
import CoreData


extension CoreDataContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataContact> {
        return NSFetchRequest<CoreDataContact>(entityName: "CoreDataContact")
    }

    @NSManaged public var company: String?
    @NSManaged public var emailAddress: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var phoneNumber: String?
    
    public var unwrappedFirstName: String {
        firstName ?? ""
    }
    
    public var unwrappedLastName: String {
        lastName ?? ""
    }
    
    public var unwrappedCompany: String {
        company ?? ""
    }
    
    public var unwrappedEmailAddress: String {
        emailAddress ?? ""
    }
    
    public var unwrappedPhoneNumber: String {
        phoneNumber ?? ""
    }
    
    public var fullName: String {
        "\(unwrappedFirstName) \(unwrappedLastName)"
    }

}

extension CoreDataContact : Identifiable {

}
