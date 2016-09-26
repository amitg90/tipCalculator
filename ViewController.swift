//
//  ViewController.swift
//  tipCalculator
//
//  Created by Amit Grover on 9/25/16.
//  Copyright © 2016 Amit Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textChange: UITextField!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var segmentSelector: UISegmentedControl!
    
    var tipPercentage = [0.1, 0.18, 0.22]
    var defaultTipPercent: Double = 0.1
    var defaultSegmentID: Int = 0
    
    func readDefaultTipFromUserDefaults() {
        // read default tip percentage
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultSegmentID = defaults.integerForKey("userTipDefault")
        segmentSelector.selectedSegmentIndex = defaultSegmentID
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        textChange.text = ""
        tipText.text    = String(format: "$%.2f", 0.0)
        totalText.text  = String(format: "$%.2f", 0.0)
        
        // read default tip to select
        readDefaultTipFromUserDefaults()
    }
    
    @IBAction func tapGesture(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func billAmitChanged(sender: AnyObject) {
        let billAmt = Double(textChange.text!) ?? 0
        let tip = Double(billAmt) * tipPercentage[segmentSelector.selectedSegmentIndex]
        let total = billAmt + tip
        
        tipText.text    = String(format: "$%.2f", tip)
        totalText.text  = String(format: "$%.2f", total)
    }


}

