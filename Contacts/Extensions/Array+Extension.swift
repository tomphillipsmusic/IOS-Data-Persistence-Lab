//
//  Array+Extension.swift
//  Contacts
//
//  Created by Tom Phillips on 3/3/22.
//

import Foundation

extension Array where Element: Identifiable {
    mutating func update(existing element: Element) {
        if let existingElementIndex = self.firstIndex(where: { $0.id == element.id }) {
            self[existingElementIndex] = element
        }
    }
}
