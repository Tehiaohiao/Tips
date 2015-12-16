//
//  SettingsViewController.swift
//  Tips
//
//  Created by Angelica Tao on 12/15/15.
//  Copyright © 2015 Tehiaohiao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip1SetButton: UIButton!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip2SetButton: UIButton!
    @IBOutlet weak var tip3Field: UITextField!
    @IBOutlet weak var tip3SetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipOne = defaults.integerForKey("newTipOnePercent")
        if tipOne != 0 {
            defaultTipControl.setTitle("\(tipOne)%", forSegmentAtIndex: 0)
        }
        var tipTwo = defaults.integerForKey("newTipTwoPercent")
        if tipTwo != 0 {
            defaultTipControl.setTitle("\(tipTwo)%", forSegmentAtIndex: 1)
        }
        var tipThree = defaults.integerForKey("newTipThreePercent")
        if tipThree != 0 {
            defaultTipControl.setTitle("\(tipThree)%", forSegmentAtIndex: 2)
        }
        var defaultTipIndex = defaults.integerForKey("defaultPercent") as Int?
        if defaultTipIndex != nil {
            defaultTipControl.selectedSegmentIndex = defaultTipIndex!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultPercent")
        defaults.synchronize()
    }

    @IBAction func tipOneChanged(sender: AnyObject) {
        if tip1Field.text != "" {
            var newTipOne = NSString(string: tip1Field.text!).integerValue
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(newTipOne, forKey: "newTipOnePercent")
            defaults.synchronize()
            defaultTipControl.setTitle("\(newTipOne)%", forSegmentAtIndex: 0)
        }
    }
    
    @IBAction func tipTwoChanged(sender: AnyObject) {
        if tip2Field.text != "" {
            var newTipTwo = NSString(string: tip2Field.text!).integerValue
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(newTipTwo, forKey: "newTipTwoPercent")
            defaults.synchronize()
            defaultTipControl.setTitle("\(newTipTwo)%", forSegmentAtIndex: 1)
        }
    }
    
    @IBAction func tipThreeChanged(sender: AnyObject) {
        if tip3Field.text != "" {
            var newTipThree = NSString(string: tip3Field.text!).integerValue
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(newTipThree, forKey: "newTipThreePercent")
            defaults.synchronize()
            defaultTipControl.setTitle("\(newTipThree)%", forSegmentAtIndex: 2)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
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
