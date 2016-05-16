//
//  SettingsViewControlerViewController.swift
//  TipsCal
//
//  Created by John Whisker on 5/16/16.
//  Copyright © 2016 John Whisker. All rights reserved.
//

import UIKit

class SettingsViewControlerViewController: UIViewController {
    @IBOutlet weak var tipDefaultSeament: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipDefaultSeament.selectedSegmentIndex = defaults.integerForKey("selected")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEdittingChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        print(tipDefaultSeament.selectedSegmentIndex)
        defaults.setInteger(tipDefaultSeament.selectedSegmentIndex, forKey: "selected")
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
