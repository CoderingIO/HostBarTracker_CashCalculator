//
//  PasswordRegEx.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/15/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation


struct RegExp {
    
    static func checkPasswordComplexity(password password:String, length:Int, patternsToEscape:[String], caseSensitivity:Bool, numericDigits:Bool) -> Bool {
        if (password.characters.count < length) {
            print("password must be \(length) characters long")
            return false
        }
    
        if caseSensitivity {
            let hasUpperCase = RegExp.matchesForRegexinText("[A-Z]", text: password).count > 0
            if !hasUpperCase {
                print("password needs 1 upper case letter")
                return false
            }
            let hasLowerCase = RegExp.matchesForRegexinText("[a-z]", text: password).count > 0
            if !hasLowerCase {
                print("password needs 1 lower case letter")
                return false
            }
        }
        if numericDigits {
            let hasNumbers = RegExp.matchesForRegexinText("\\d", text: password).count > 0
            if !hasNumbers {
                print("password needs 1 number")
                return false
            }
        }
        if patternsToEscape.count > 0 {
            let passwordLowerCase = password.lowercaseString
            for pattern in patternsToEscape {
                let hasMatchesWithPattern = RegExp.matchesForRegexinText(pattern, text: passwordLowerCase).count > 0
                if hasMatchesWithPattern {
                    print("password matches escaped pattern")
                    return false
                }
            }
        }
        return true
    }
    
    
    static func matchesForRegexinText(regex:String, text:String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matchesInString(text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substringWithRange($0.range) }
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    static func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
}