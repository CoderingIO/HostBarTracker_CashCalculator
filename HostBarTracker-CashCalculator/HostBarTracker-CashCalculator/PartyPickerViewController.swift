//
//  PartyPickerViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/25/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import Firebase

class PartyPickerViewController: UIViewController {
    
    @IBOutlet weak var partyPicker: UIPickerView!
    
    var pickerData = [PartyMaker]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
