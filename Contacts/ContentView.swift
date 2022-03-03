//
//  ContentView.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var isShowingForm = false
    
    var body: some View {
        NavigationView {
            List(viewModel.contacts) { contact in
                NavigationLink(contact.fullName, destination: ContactDetailView(contact: contact))
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
            .navigationTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
