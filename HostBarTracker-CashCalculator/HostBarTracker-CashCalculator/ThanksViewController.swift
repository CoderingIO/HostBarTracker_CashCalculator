//
//  ThanksViewController.swift
//  HostBarTracker-CashCalculator
//
//  Created by Wayne Bangert on 6/14/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class ThanksViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
    
    }
    
    @IBAction func continueTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("ManagerScreen", sender: self)
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
