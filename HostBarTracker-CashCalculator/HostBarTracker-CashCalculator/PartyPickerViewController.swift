//
//  PartyPickerViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/25/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PartyPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var partyPicker: UIPickerView!
    
    var partyList = [PartyMaker]()

    let ref = FIRDatabase.database().reference()
    
    var partyListByName = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref.child("users/groupID").child("Parties").observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            for party in snapshot.children {
                let fbStoredParty = PartyMaker.init(snapshot: party as! FIRDataSnapshot)
                self.partyList.append(fbStoredParty)
            }
            print("number of parties \(self.partyList.count)")

        })
        self.partyPicker.delegate = self
        self.partyPicker.dataSource = self        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        for party in partyList {
            partyListByName.append(party.name)
        }
        partyPicker.reloadAllComponents()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partyListByName.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return partyListByName[row]
    
    }

    @IBAction func goToPartyTouched(sender: AnyObject) {
        
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
