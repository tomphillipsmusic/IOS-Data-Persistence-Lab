//
//  JSONHelper.swift
//  Contacts
//
//  Created by Tyler Lawrence on 7/13/22.
//

import Foundation

struct JSONUtility {
    static func write(_ contacts: [Contact]) -> Void {
        do {
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("contacts.json")

            try JSONEncoder().encode(contacts)
                .write(to: filePath)
            
        } catch (let error) {
            print(error)
        }
    }
    
    static func read() -> [Contact] {
        do {
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("contacts.json")
            
            let data = try Data(contentsOf: filePath)
            let contacts = try JSONDecoder().decode([Contact].self, from: data)
            return contacts
        } catch {
            print(error)
            return []
        }
    }
}
