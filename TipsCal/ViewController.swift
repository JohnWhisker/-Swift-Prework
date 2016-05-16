//
//  ViewController.swift
//  TipsCal
//
//  Created by John Whisker on 5/13/16.
//  Copyright © 2016 John Whisker. All rights reserved.
//

import UIKit
struct Number {
    static let formatterWithSepator: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .DecimalStyle
        return formatter
    }()
}
extension IntegerType {
    var stringFormatedWithSepator: String {
        return Number.formatterWithSepator.stringFromNumber(hashValue) ?? ""
    }
}
class ViewController: UIViewController {
       @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    var tipPercentages = [0.18,0.2,0.22]
   
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let selected = defaults.integerForKey("selected")
        print(selected)
        tipSegment.selectedSegmentIndex = selected
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        billField.becomeFirstResponder()    
        let defaults = NSUserDefaults.standardUserDefaults()
        let bill = defaults.doubleForKey("bill")
        let selected = defaults.integerForKey("selected")
        billField.text = reFormat(bill)
        calAndSet(bill, selected: selected)
        
    }

   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEdittingChanged(sender: AnyObject) {
        let billAmount = NSString(string: billField.text!).doubleValue
        calAndSet(billAmount, selected: -1)
    }
    
    func calAndSet(billAmount:Double,selected:Int){
        if(selected != -1 ){
            tipSegment.selectedSegmentIndex = selected
        }        
        let tip = billAmount * tipPercentages[ tipSegment.selectedSegmentIndex]
        let total = billAmount+tip
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "bill")
        defaults.setInteger(tipSegment.selectedSegmentIndex, forKey: "selected")
        defaults.synchronize()
        
        tipLabel.text = reFormat(tip)
        totalLabel.text = reFormat(total)
    }
    func reFormat(input:Double)->String  {
        let formatter = NSNumberFormatter()
        formatter.locale = NSLocale.currentLocale()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        print(formatter.stringFromNumber(input)!)
        return formatter.stringFromNumber(input)!
        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

