//
//  JSONHelper.swift
//  Contacts
//
//  Created by Tyler Lawrence on 7/13/22.
//

import Foundation

struct JSONUtility {

    static func write<T: Codable>(_ data: T) -> Void {
        do {
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("contacts.json")

            try JSONEncoder().encode(data)
                .write(to: filePath)
            
        } catch (let error) {
            print(error)
        }
    }
    
    static func read<T: Codable> () -> T? {
        do {
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("contacts.json")
            
            let data = try Data(contentsOf: filePath)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
