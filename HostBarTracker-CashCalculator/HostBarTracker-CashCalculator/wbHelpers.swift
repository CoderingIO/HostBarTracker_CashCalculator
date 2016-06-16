//
//  wbHelpers.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/12/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation

func isValidEmail(email:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailTest.evaluateWithObject(email)
}

func isValidPhoneNumber(phoneNumber:String) -> Bool {
    let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
    
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
    return phoneTest.evaluateWithObject(phoneNumber)
    
}