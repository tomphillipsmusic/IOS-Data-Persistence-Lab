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
        VStack {
            ZStack {
                AddPhotoView(image: $contact.image)
                plusSymbol
            }
            
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
                    .disabled(!contact.isValid())
                }
            }
            .navigationTitle(viewModel.formTitle)
        }
    }
    
    var plusSymbol: some View {
        Image(systemName: "plus")
            .foregroundColor(.white)
            .frame(width: 25, height: 25)
            .background(Color.blue)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
            .environmentObject(ViewModel(contacts: Contact.testData))
    }
}
