//
//  SettingsViewController.swift
//  CalculatorPlusTips
//
//  Created by Lucas Andrade on 02/12/15.
//  Copyright © 2015 LucasRibeiro. All rights reserved.
//
import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var pickerLabel1: UIPickerView!
    @IBOutlet weak var pickerLabel2: UIPickerView!
    @IBOutlet weak var pickerLabel3: UIPickerView!
    @IBOutlet weak var labelPercentage1: UILabel!
    @IBOutlet weak var labelPercentage2: UILabel!
    @IBOutlet weak var labelpercentage3: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var percentage1: AnyObject = "18"
    var percentage2: AnyObject = "20"
    var percentage3: AnyObject = "22"
    
    
    //go back to main viewController
    @IBAction func backButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        
        //used because curl animation to do not reverse back animation touching anything
        self.view.gestureRecognizers?.removeAll()
        
        //reading settings
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("percentage1") != nil){
            percentage1 = defaults.objectForKey("percentage1") as! String
            percentage2 = defaults.objectForKey("percentage2") as! String
            percentage3 = defaults.objectForKey("percentage3") as! String
        }
        
        //setting pickerView initial positions
        self.pickerLabel1.selectRow(percentage1.integerValue, inComponent: 0, animated: true)
        self.pickerLabel2.selectRow(percentage2.integerValue, inComponent: 0, animated: true)
        self.pickerLabel3.selectRow(percentage3.integerValue, inComponent: 0, animated: true)

        
        //setting labels
        labelPercentage1.text = String(format: "\(percentage1)%%")
        labelPercentage2.text = String(format: "\(percentage2)%%")
        labelpercentage3.text = String(format: "\(percentage3)%%")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%d", row)
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        //changing pickerView color
        let attributedString = NSAttributedString(string: String(format: "%d", row), attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        return attributedString
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()

        //changing label text according to pickerView change and saving settings
        switch pickerView.tag{
            case 1:
                defaults.setObject(String(format: "%d", row), forKey: "percentage1")
                labelPercentage1.text = String(format: "%d%%", row)
            case 2:
                defaults.setObject(String(format: "%d", row), forKey: "percentage2")
                labelPercentage2.text = String(format: "%d%%", row)
            case 3:
                defaults.setObject(String(format: "%d", row), forKey: "percentage3")
                labelpercentage3.text = String(format: "%d%%", row)
            default:
            print("no pickerView found")
        }
        defaults.synchronize()
    }
}
