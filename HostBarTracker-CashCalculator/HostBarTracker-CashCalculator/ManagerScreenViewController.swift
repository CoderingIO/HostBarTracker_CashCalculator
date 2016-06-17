//
//  ManagerScreenViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/16/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class ManagerScreenViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    @IBAction func addUserTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("addUser", sender: self)
    }

    @IBAction func addPartyTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("addParty", sender: self)
    }
    
    @IBAction func addDrinkTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("addDrink", sender: self)
    }
    
    @IBAction func goToPartyTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("goToParty", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addUser"
        {
            let vc = segue.destinationViewController
            let controller = vc.popoverPresentationController
            if controller != nil {
                controller?.delegate = self
            }
        }
        if segue.identifier == "addParty"
        {
            let vc = segue.destinationViewController
            let controller = vc.popoverPresentationController
            if controller != nil {
                controller?.delegate = self
            }
        }
        if segue.identifier == "addDrink"
        {
            let vc = segue.destinationViewController
            let controller = vc.popoverPresentationController
            if controller != nil {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
}
