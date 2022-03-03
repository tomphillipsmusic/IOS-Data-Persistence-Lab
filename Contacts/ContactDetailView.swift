//
//  ContactDetailView.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: Contact
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            if isEditing {
                AddContactView(existingContact: contact)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Cancel") {
                                withAnimation {
                                    isEditing = false
                                }
                            }
                        }
                    }
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
                Button(isEditing ? "Cancel" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
        }
        .navigationTitle(contact.fullName)
        //        .sheet(isPresented: $isEditing) {
        //            AddContactView(existingContact: contact)
        //        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact.example)
    }
}
