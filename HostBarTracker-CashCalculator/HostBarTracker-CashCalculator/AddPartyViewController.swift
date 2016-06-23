//
//  AddPartyViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddPartyViewController: UIViewController {
    

    @IBOutlet weak var nameOfPartyTextField: UITextField!
    @IBOutlet weak var dateOfPartyTextField: UITextField!
    @IBOutlet weak var isHostedSwitch: UISwitch!
    @IBOutlet weak var capAmountTextField: UITextField!
    
    var parties = [PartyMaker]()
    var isCashBar:Bool = false
    
    
    let ref = FIRDatabase.database().reference()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        isHostedSwitch.addTarget(self, action:#selector(AddPartyViewController.isCashBarTouched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
    }

    
    func isCashBarTouched(sender: AnyObject) {
        
        if isHostedSwitch.on {
            isCashBar = true
            isHostedSwitch.setOn(true, animated: true)
        } else {
            isCashBar = false
            isHostedSwitch.setOn(false, animated: true)
        }
        print(isCashBar)

    }
    
    
    @IBAction func CreatPartyTouched(sender: AnyObject) {
        
        let newParty = PartyMaker(date: dateOfPartyTextField.text!, name: nameOfPartyTextField.text!, isCashBar: isCashBar, capAmount: Double(capAmountTextField.text!)!)
        
        self.ref.child("users/\(FIRAuth.auth()!.currentUser!.uid)").child(nameOfPartyTextField.text!).setValue(newParty.toAnyObject())
    
        parties.append(PartyMaker.init(date: (dateOfPartyTextField.text!), name: nameOfPartyTextField.text!, isCashBar:isCashBar, capAmount:Double(capAmountTextField.text!)!))
        //for party in parties {
        //    print(party.name, party.date, party.capAmount, party.isCashBar)
        //}
        dismissViewControllerAnimated(true, completion: nil)
    }
}
