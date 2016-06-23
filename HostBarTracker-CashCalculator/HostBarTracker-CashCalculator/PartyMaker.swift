//
//  PartyMaker.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation

public class PartyMaker {
    var date:String = ""
    var name:String = ""
    var isCashBar:Bool = false
    var capAmount:Double = 0
    
    public init(date:String, name:String, isCashBar:Bool, capAmount:Double) {
        self.date = date
        self.name = name
        self.isCashBar = isCashBar
        self.capAmount = capAmount
    }
    
    public func toAnyObject() -> AnyObject {
        return [
            "date": date,
            "name": name,
            "isCashBar": isCashBar,
            "capAmount": capAmount
        ]
    }
}
