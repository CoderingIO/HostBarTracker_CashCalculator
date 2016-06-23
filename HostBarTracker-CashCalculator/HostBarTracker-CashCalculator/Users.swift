//
//  Users.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/16/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation
import FirebaseAuth

class User {
    let gid:String
    let email:String
    //Mark:Properties of user
    // list of drinks
    var drinkList:Array = [DrinkMaker]()
    // list of parties
    var partyList:Array = [PartyMaker]()
    // list of users
//    var
    // Group ID
    
    
    init(gid:String, email:String, drinkList:[DrinkMaker], partyList:[PartyMaker]) {
        self.gid = gid
        self.email = email
        self.drinkList = drinkList
        self.partyList = partyList
        
    }
    
}
