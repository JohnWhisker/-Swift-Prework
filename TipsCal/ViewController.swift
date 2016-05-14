//
//  ViewController.swift
//  TipsCal
//
//  Created by John Whisker on 5/13/16.
//  Copyright © 2016 John Whisker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEdittingChanged(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount*tipPercentages[ tipSegment.selectedSegmentIndex]
        var total = billAmount+tip
        
              
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

