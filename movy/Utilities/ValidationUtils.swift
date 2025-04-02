//
//  ValidationUtils.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 25/03/2025.
//

import Foundation

struct ValidationUtils {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES[c] %@", emailRegex).evaluate(with: email)
    }
    
    static func isValidCvv(_ cvv: String) -> Bool {
        let trimmed = cvv.trimmingCharacters(in: .whitespacesAndNewlines)
        let regex = "^[0-9]{3,4}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: trimmed)
    }
}
