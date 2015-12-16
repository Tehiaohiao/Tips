//
//  ViewController.swift
//  Tips
//
//  Created by Angelica Tao on 12/15/15.
//  Copyright © 2015 Tehiaohiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var tipPercentages = [0.18, 0.2, 0.22]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipOne = defaults.integerForKey("newTipOnePercent")
        if tipOne != 0 {
            tipPercentages[0] = Double(tipOne) * 0.01
            tipControl.setTitle("\(tipOne)%", forSegmentAtIndex: 0)
        }
        var tipTwo = defaults.integerForKey("newTipTwoPercent")
        if tipTwo != 0 {
            tipPercentages[1] = Double(tipTwo) * 0.01
            tipControl.setTitle("\(tipTwo)%", forSegmentAtIndex: 1)
        }
        var tipThree = defaults.integerForKey("newTipThreePercent")
        if tipThree != 0 {
            tipPercentages[2] = Double(tipThree) * 0.01
            tipControl.setTitle("\(tipThree)%", forSegmentAtIndex: 2)
        }
        var tipControlIndex = defaults.integerForKey("defaultPercent") as Int?
        if tipControlIndex != nil {
            tipControl.selectedSegmentIndex = tipControlIndex!
            var billAmount: Double = NSString(string: billField.text!).doubleValue
            var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            var tip = billAmount * tipPercentage
            var total = billAmount + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        //        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

