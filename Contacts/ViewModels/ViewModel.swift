//
//  ViewModel.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published private(set) var contacts: [Contact]
    @Published var isEditing = false
    let defaults = UserDefaults.standard
    @AppStorage("searchText") var searchText = ""
    
    var searchResults: [Contact] {
        searchText.isEmpty ? contacts : contacts.filter {$0.fullName.lowercased().contains(searchText.lowercased())}
    }
    
    var sortedContacts: [Contact] {
        searchResults.sorted(by: { $0.fullName < $1.fullName })
    }
    
    var toolbarItemText: String {
        return isEditing ? "Cancel" : "Edit"
    }
    
    var formTitle: String {
        return isEditing ? "Edit Contact" : "Add New Contact"
    }
    
    init(contacts: [Contact]) {
        self.contacts = contacts
    }
    
    func submit(_ contact: Contact) {
        if isEditing {
            update(existing: contact)
        } else {
            save(new: contact)
        }
    }
    
    func save(new newContact: Contact) {
        contacts.append(newContact)
        isEditing = false
    }
    
    func update(existing contact: Contact) {
        contacts.update(existing: contact)
        isEditing = false
    }
    
    func delete(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}
