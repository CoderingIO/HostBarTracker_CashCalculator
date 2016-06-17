//
//  LoginViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/11/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import Firebase
// need to import FirebaseAuth Framework.
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // String to pass whenver needed to pass app name
    let appName:String = "HostBarTracker_CashCalculator"
    
    // ref to Firebase URL
    //let ref = FIRApp(named:"https://hostbartracker-cashcalculator.firebaseio.com/")
    
    
    // link to user name text field
    @IBOutlet weak var username: UITextField!
    
    
    // link to password textfield
    @IBOutlet var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    @IBAction func GoToPartyTouched(sender: AnyObject) {
        
        FIRAuth.auth()?.signInWithEmail(username.text!, password: password.text!) { (user, error) in
        }
    
    }
    
    @IBAction func signUpTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("Welcome", sender: nil)
    }
    

}
