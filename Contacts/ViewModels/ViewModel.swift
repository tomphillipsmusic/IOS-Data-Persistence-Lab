//
//  ViewModel.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private(set) var contacts: [Contact]
    @Published var isEditing = false
    let defaults = UserDefaults.standard
    @Published var searchText = UserDefaults.standard.string(forKey: "searchText") ?? "" {
        didSet{
            defaults.set(searchText, forKey: "searchText")

        }
    }
    
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
