//
//  AddUserViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/16/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import FirebaseAuth

class AddUserViewController: UIViewController {

    @IBOutlet weak var enterUserNameTextField: UITextField!
    
    @IBOutlet weak var enterUserPasswordTextField: UITextField!
    
    @IBOutlet weak var isManagerSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createUserTouched(sender: AnyObject)
    {
        let newUsername = enterUserNameTextField.text
        let newUserPassword = enterUserPasswordTextField.text
        
        if RegExp.isValidEmail(newUsername!) == true
        {
            if RegExp.checkPasswordComplexity(password: newUserPassword!, length: 6, patternsToEscape: [], caseSensitivity: true, numericDigits: true)
            {
                
               FIRAuth.auth()?.createUserWithEmail(newUsername!, password: newUserPassword!)
                { (user, error) in
                    
                    
                    
                    
                    if let error = error
                    {
                        print(error.localizedDescription)
                        return
                    }
                    
                }
                    self .dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
}
