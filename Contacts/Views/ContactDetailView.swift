//
//  ContactDetailView.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import SwiftUI

struct ContactDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    var contact: Contact
    
    var body: some View {
        VStack {
            if viewModel.isEditing {
                AddContactView(existing: contact)
            } else {
                List {
                    Section("Company") {
                        Text(contact.company)
                    }
                    
                    Section("Phone Number") {
                        Text(contact.phoneNumber)
                    }
                    
                    Section("Email Address") {
                        Text(contact.emailAddress)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(viewModel.toolbarItemText) {
                    withAnimation {
                        viewModel.isEditing.toggle()
                    }
                }
            }
        }
        .navigationTitle(contact.fullName)
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact.example)
    }
}
