//
//  ContactsApp.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import SwiftUI

@main
struct ContactsApp: App {
    @StateObject var viewModel = ViewModel(contacts: [Contact.example])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
