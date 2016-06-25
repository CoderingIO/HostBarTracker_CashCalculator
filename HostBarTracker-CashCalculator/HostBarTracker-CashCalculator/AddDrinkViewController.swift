//
//  AddDrinkViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/23/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AddDrinkViewController: UIViewController {

    @IBOutlet weak var nameOfDrinkTextField: UITextField!
    @IBOutlet weak var priceOfDrinkTextField: UITextField!
    
    let ref = FIRDatabase.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeDrinkTouched(sender: AnyObject) {
        
        let newDrink = DrinkMaker(nameOfDrink: nameOfDrinkTextField.text!, price: Double(priceOfDrinkTextField.text!)!, timesTouched: 0, count: 0)
        
        self.ref.child("users/groupID/Drinks").child(nameOfDrinkTextField.text!).setValue(newDrink.toAnyObject())

        
        //self.ref.child("users/\(FIRAuth.auth()!.currentUser!.uid)").child(nameOfDrinkTextField.text!).setValue(newDrink.toAnyObject())
        
    
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
