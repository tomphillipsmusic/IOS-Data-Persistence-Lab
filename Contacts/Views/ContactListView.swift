//
//  ContentView.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import SwiftUI

struct ContactListView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var isShowingForm = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.sortedContacts) { contact in
                    NavigationLink(contact.fullName, destination: ContactDetailView(contact: contact))
                }
                .onDelete(perform: viewModel.delete)
                
                if viewModel.contacts.isEmpty {
                    Text("Tap the plus button to add a contact")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingForm = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $isShowingForm) {
                AddContactView()
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
            .environmentObject(ViewModel(contacts: Contact.testData))
    }
}
