//
//  SignUpViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/12/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //signUpButton.enabled = false
        
        
        }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let user = user {
                //user is signed in
                print(user)
            } else {
                // no one is signed in
            }
        }
    }
    
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpTouched(sender: AnyObject)
    {
        let newEmail = emailTextField.text
        let newPassword = passwordTextField.text
        
        if isValidEmail(newEmail!) == true
        {
            if RegExp.checkPasswordComplexity(password: newPassword!, length: 8, patternsToEscape: ["pass"], caseSensitivity: true, numericDigits: true)
            
            {
            
                FIRAuth.auth()?.createUserWithEmail(newEmail!, password: passwordTextField.text!)
                { (user, error) in
                    if let error = error
                    {
                        print(error.localizedDescription)
                        return
                    }
                
                    if error == nil
                    {
                        FIRAuth.auth()?.signInWithEmail(self.emailTextField.text!, password: self.passwordTextField.text!)
                        { (user, error) in
                        
                            self.performSegueWithIdentifier("ThankYouPopover", sender: self)
                            
                        }
                    }
                }
            } else {
                passwordErrorLabel.text = "Password must be at least 6 characters in lenght with at least capital 1 letter, small letter, number, and symbol."
            }

        } else {
            emailErrorLabel.text = "Please enter valid email address."
        }
        
        
        
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

