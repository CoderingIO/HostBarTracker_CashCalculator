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
    

    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpTouched(sender: AnyObject)
    {
        let newEmail = emailTextField.text
        let newPassword = passwordTextField.text
        
        if RegExp.isValidEmail(newEmail!) == true
        {
            if RegExp.checkPasswordComplexity(password: newPassword!, length: 8, patternsToEscape: ["pass"], caseSensitivity: true, numericDigits: true)
            {
            
                FIRAuth.auth()?.createUserWithEmail(newEmail!, password: newPassword!)
                { (user, error) in
                    if let error = error
                    {
                        print(error.localizedDescription)
                        return
                    }
                    
                    // verification of user getting created do not need for release
                    if let user = FIRAuth.auth()?.currentUser {
                        _ = user.email
                        print(user.email)
                        _ = user.uid
                        print(user.uid)
                        // The user's ID, unique to the Firebase project.
                        // Do NOT use this value to authenticate with
                        // your backend server, if you have one. Use
                        // getTokenWithCompletion:completion: instead.
                    } else {
                        // No user is signed in.
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

