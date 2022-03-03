//
//  ViewModel.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import Foundation
import Metal

class ViewModel: ObservableObject {
    @Published private(set) var contacts: [Contact]
    @Published var isEditing = false
    
    var toolbarItemText: String {
        return isEditing ? "Cancel" : "Edit"
    }
    
    var formTitle: String {
        return isEditing ? "Edit Contact" : "Add New Contact"
    }
    
    init(contacts: [Contact]) {
        self.contacts = contacts
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
