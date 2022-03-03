//
//  ViewModel.swift
//  Contacts
//
//  Created by Tom Phillips on 3/2/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var contacts: [Contact]
    
    init(contacts: [Contact]) {
        self.contacts = contacts
    }
}
