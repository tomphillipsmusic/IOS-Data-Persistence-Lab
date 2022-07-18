//
//  ViewModel.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import Foundation
import SwiftUI
import CoreData

class ViewModel: ObservableObject {
//    @Environment(\.managedObjectContext) var managedObjectContext
    var managedObjectContext = PersistenceController.shared.container.viewContext
    @Published private(set) var contacts: [Contact]
    @Published var isEditing = false
    @Published var searchText = ""
    
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
        let coreDataContact = CoreDataContact(contact: newContact, context: managedObjectContext)
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
        
        isEditing = false
    }
    
    func update(existing contact: Contact) {
        contacts.update(existing: contact)
        isEditing = false
    }
    
    func delete(at offsets: IndexSet) {
        if let index = offsets.first,
           let indexToDelete = contacts.firstIndex(where: {$0.id == sortedContacts[index].id}){
            contacts.remove(at: indexToDelete)
        }
    }
}
