//
//  AddContactView.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    @State private var newContact: Contact
    private var isEditing = false
    
    init(existingContact: Contact? = nil) {
        if let existingContact = existingContact {
            _newContact = State(initialValue: existingContact)
            isEditing = true
        } else {
            _newContact = State(initialValue: Contact(firstName: "", lastName: "", company: "", phoneNumber: "", emailAddress: ""))
        }
    }
    
    var body: some View {
        Form {
            Section("Name") {
                
                TextField("First", text: $newContact.firstName)
                    .padding()
                
                TextField("Last", text: $newContact.lastName)
                    .padding()
            }

            Section("Company") {
                TextField("Company Name", text: $newContact.company)
                    .padding()
            }

            Section("Contact Information") {
                TextField("Email", text: $newContact.emailAddress)
                    .padding()
                
                TextField("Phone Number", text: $newContact.phoneNumber)
                    .padding()
            }
            
            Section {
                Button("Save") {
                    if isEditing {
                        if let existingContactIndex = viewModel.contacts.firstIndex(where: { $0.id == newContact.id}) {
                            viewModel.contacts[existingContactIndex] = newContact
                        }
                        
                    } else {
                        viewModel.contacts.append(newContact)
                    }
                    dismiss()
                }
            }
        }
        .navigationTitle(isEditing ? "Edit Contact" : "Add New Contact")
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
