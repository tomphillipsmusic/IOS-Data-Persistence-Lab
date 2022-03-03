//
//  Contact.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import Foundation

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
    
    static let example = Contact(firstName: "Tom", lastName: "Phillips", company: "Apple Developer Academy", phoneNumber: "609-647-5411", emailAddress: "tomphillipsmusic@gmail.com")
}
