//
//  DrinkMaker.swift
//  WellshireBarCalc
//
//  Created by Wayne Bangert on 6/1/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation

public class DrinkMaker {
    let name:String
    let price:Double
    var timesTouched:Int
    var count:Int
    
    public init(nameOfDrink:String, price:Double, timesTouched:Int, count:Int) {
        self.name = nameOfDrink
        self.price = price
        self.timesTouched = timesTouched
        self.count = count
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "name": name,
            "price": price,
            "timesTouched": timesTouched,
            "counter": count
        ]
    }
    
}
