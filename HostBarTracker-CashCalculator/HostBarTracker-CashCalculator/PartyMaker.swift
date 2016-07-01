//
//  PartyMaker.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation
import FirebaseDatabase

public class PartyMaker {
    var date:String = ""
    var name:String = ""
    var isCashBar:Bool = false
    var capAmount:Double = 0
    var ref = FIRDatabase.database().reference()
    
    
    public init(date:String, name:String, isCashBar:Bool, capAmount:Double) {
        self.date = date
        self.name = name
        self.isCashBar = isCashBar
        self.capAmount = capAmount
    
    }
    
    public init(snapshot:FIRDataSnapshot) {
        date = snapshot.value!["date"] as! String
        name = snapshot.value!["name"] as! String
        isCashBar = snapshot.value!["isCashBar"] as! Bool
        capAmount = snapshot.value!["capAmount"] as! Double
        ref = snapshot.ref
        
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
