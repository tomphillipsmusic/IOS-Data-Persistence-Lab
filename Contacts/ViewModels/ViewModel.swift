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
        
        // we want to convert a contact to JSON and save it here
        contacts.append(newContact)
        JSONUtility.write(contacts)

        isEditing = false
    }
    
    func update(existing contact: Contact) {
        contacts.update(existing: contact)
        JSONUtility.write(contacts)
        isEditing = false
    }
    
    func delete(at offsets: IndexSet) {
        if let index = offsets.first,
           let indexToDelete = contacts.firstIndex(where: {$0.id == sortedContacts[index].id}){
            contacts.remove(at: indexToDelete)
            JSONUtility.write(contacts)
        }
    }
}
