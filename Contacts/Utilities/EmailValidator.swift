//
//  EmailValidator.swift
//  Contacts
//
//  Created by Tom Phillips on 3/4/22.
//

import Foundation

struct EmailValidator {
    static func checkIfValid(email: String) -> Bool {
        let detector = try? NSDataDetector(
            types: NSTextCheckingResult.CheckingType.link.rawValue
        )
        
        let range = NSRange(
            email.startIndex..<email.endIndex,
            in: email
        )
        
        let matches = detector?.matches(
            in: email,
            options: [],
            range: range
        )
        
        // We only want our string to contain a single email
        // address, so if multiple matches were found, then
        // we fail our validation process and return nil:
        guard let match = matches?.first, matches?.count == 1 else {
            return false
        }
        
        print(match)
        
        // Verify that the found link points to an email address,
        // and that its range covers the whole input string:
        guard match.url?.scheme == "mailto", match.range == range else {
            return false
        }
        
        return true
    }
}
