//
//  Contact.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var company: String
    var phoneNumber: String
    var emailAddress: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    func isValid() -> Bool {
        !firstName.isEmpty &&
        !lastName.isEmpty &&
        !phoneNumber.isEmpty &&
        !emailAddress.isEmpty &&
        EmailValidator.checkIfValid(email: emailAddress)
    }
    
    init(coreDataContact: CoreDataContact){
        self.id = coreDataContact.id ?? UUID()
        self.firstName = coreDataContact.unwrappedFirstName
        self.lastName = coreDataContact.unwrappedLastName
        self.company = coreDataContact.unwrappedCompany
        self.phoneNumber = coreDataContact.unwrappedPhoneNumber
        self.emailAddress = coreDataContact.unwrappedEmailAddress
    }
    
    init(firstName: String, lastName: String, company: String, phoneNumber: String, emailAddress: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
    }
}

extension Contact {
    static let example = Contact(firstName: "Tom", lastName: "Phillips", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "tomphillipsmusic@gmail.com")
    
    static let testData = [
        Contact(firstName: "Tom", lastName: "Phillips", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Zoe", lastName: "Cutler", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Tyler", lastName: "Lawrence", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Tariq", lastName: "Williams", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Anny", lastName: "Staten", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Mike", lastName: "Antaran", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Mike", lastName: "Goggins", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Rhiannon", lastName: "Pleins", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Lilyan", lastName: "Talia", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Sarah", lastName: "Gretter", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Telayne", lastName: "Keith", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Arlaya", lastName: "Worthen", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com"),
        Contact(firstName: "Cat", lastName: "Colvin", company: "Apple Developer Academy", phoneNumber: "123-456-7890", emailAddress: "example@developeracademy.com")
    ]
}
