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
    @State private var contact: Contact
    
    init(existing contact: Contact? = nil) {
        
        if let existingContact = contact {
            _contact = State(initialValue: existingContact)
        } else {
            _contact = State(initialValue: Contact(firstName: "", lastName: "", company: "", phoneNumber: "", emailAddress: ""))
        }
    }
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("First", text: $contact.firstName)
                    .padding()
                
                TextField("Last", text: $contact.lastName)
                    .padding()
            }

            Section("Company") {
                TextField("Company Name", text: $contact.company)
                    .padding()
            }

            Section("Contact Information") {
                TextField("Email", text: $contact.emailAddress)
                    .padding()
                
                TextField("Phone Number", text: $contact.phoneNumber)
                    .padding()
            }
            
            Section {
                Button("Save") {
                    if viewModel.isEditing {
                        viewModel.update(existing: contact)
                    } else {
                        viewModel.save(new: contact)
                    }
                    dismiss()
                }
            }
        }
        .navigationTitle(viewModel.formTitle)
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
