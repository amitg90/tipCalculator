//
//  SettingViewController.swift
//  tipCalculator
//
//  Created by Amit Grover on 9/25/16.
//  Copyright © 2016 Amit Grover. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var tipPercentage = [0.1, 0.18, 0.22]
    
    @IBOutlet weak var segmentID: UISegmentedControl!
    
    func readDefaultTipFromUserDefaults() {
        var defaultSegmentID: Int = 0
        
        // read default tip percentage
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultSegmentID = defaults.integerForKey("userTipDefault")
        segmentID.selectedSegmentIndex = defaultSegmentID
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        readDefaultTipFromUserDefaults()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipSet(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("Tip_Object", forKey: "userTipDefault")
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "userTipDefault")
        defaults.synchronize()
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