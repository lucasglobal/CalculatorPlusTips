//
//  ViewController.swift
//  CalculatorPlusTips
//
//  Created by Lucas Andrade on 02/12/15.
//  Copyright © 2015 LucasRibeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonPeriod: UIButton!
    @IBOutlet weak var buttonPeriodLarge: UIButton!
    @IBOutlet weak var buttonCos: UIButton!
    @IBOutlet weak var buttonLogTen: UIButton!
    @IBOutlet weak var buttonLn: UIButton!
    @IBOutlet weak var buttonTan: UIButton!
    @IBOutlet weak var buttonSin: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var buttonTanH: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonCosH: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonTripleRoot: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var buttonEulers: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonTripleCube: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonTimes: UIButton!
    @IBOutlet weak var buttonEquals: UIButton!
    @IBOutlet weak var buttonSquareRoot: UIButton!
    @IBOutlet weak var buttonSinH: UIButton!
    @IBOutlet weak var buttonMSquared: UIButton!

    @IBOutlet weak var buttonPercentage: UIButton!
    @IBOutlet weak var buttonPlusOrMinus: UIButton!
    @IBOutlet weak var billLabelSmall: UILabel!
    @IBOutlet weak var priceWithTipLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var percentage1: AnyObject = "18"
    var percentage2: AnyObject = "20"
    var percentage3: AnyObject = "22"
    var hasPeriodDot: Bool = false
    var showingBasicKeyboard: Bool = false
    var showingHighKeyboard: Bool = false
    var showingNumhKeyboard: Bool = true
    var stackCalc =  [Double]()
    var operationStack: String = "no operation"



    @IBAction func keyBoardButton(sender: AnyObject) {
        
        //using object tag to identify keyboard
        switch (sender.tag){
        case 0:
            self.billField.text! = "\(self.billField.text!)0"
            break;
        case 1:
            self.billField.text! = "\(self.billField.text!)1"
            break;
        case 2:
            self.billField.text! = "\(self.billField.text!)2"
            break;
        case 3:
            self.billField.text! = "\(self.billField.text!)3"
            break;
        case 4:
            self.billField.text! = "\(self.billField.text!)4"
            break;
        case 5:
            self.billField.text! = "\(self.billField.text!)5"
            break;
        case 6:
            self.billField.text! = "\(self.billField.text!)6"
            break;
        case 7:
            self.billField.text! = "\(self.billField.text!)7"
            break;
        case 8:
            self.billField.text! = "\(self.billField.text!)8"
            break;
        case 9:
            self.billField.text! = "\(self.billField.text!)9"
            break;
            
            //clear button
        case 10:
            self.billField.text! = ""
            hasPeriodDot = false
            self.operationStack = "no operation"
            self.stackCalc.removeAll()
            break;
        case 11:
            if(!hasPeriodDot && self.billField.text! != ""){
                self.billField.text! =  "\(self.billField.text!)."
                hasPeriodDot = true
            }
            if(self.billField.text == ""){
                self.billField.text! =  "0."
                hasPeriodDot = true
            }
            break;
        default:
            break;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.billField.delegate = self
        
        //navigationBar Settings
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        
        //fieldText settings
        self.billField.layer.borderWidth = 0
        self.billField.layer.borderColor = UIColor.clearColor().CGColor
        self.billField.borderStyle = UITextBorderStyle.None
        
        //scrollViewSettings
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.scrollView.addSubview(tipLabel)
        self.scrollView.addSubview(totalLabel)
        self.scrollView.addSubview(tipTextLabel)
        self.scrollView.addSubview(totalTextLabel)
        self.scrollView.addSubview(tipControl)
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 2, 1)
        self.scrollView.delegate = self
        self.scrollView.pagingEnabled = true

        //when needed to put in other pages of ScrollView
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        
    
        //initializing standard text for first screen
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        //putting labels in correct pages of scrollView
        self.tipTextLabel.frame = CGRectMake(scrollViewWidth*1+self.tipTextLabel.frame.origin.x, self.tipTextLabel.frame.origin.y, self.tipTextLabel.frame.size.width, self.tipTextLabel.frame.size.height)
        self.tipLabel.frame = CGRectMake(scrollViewWidth*1+self.tipLabel.frame.origin.x, self.tipLabel.frame.origin.y, self.tipLabel.frame.size.width, self.tipLabel.frame.size.height)
        self.totalTextLabel.frame = CGRectMake(scrollViewWidth*1+self.totalTextLabel.frame.origin.x, self.totalTextLabel.frame.origin.y, self.totalTextLabel.frame.size.width, self.totalTextLabel.frame.size.height)
        self.totalLabel.frame = CGRectMake(scrollViewWidth*1+self.totalLabel.frame.origin.x, self.totalLabel.frame.origin.y, self.totalLabel.frame.size.width, self.totalLabel.frame.size.height)
         self.tipControl.frame = CGRectMake(scrollViewWidth*1+self.tipControl.frame.origin.x, self.tipControl.frame.origin.y, self.tipControl.frame.size.width, self.tipControl.frame.size.height)
        self.priceWithTipLabel.frame = CGRectMake(scrollViewWidth*1+self.priceWithTipLabel.frame.origin.x, self.priceWithTipLabel.frame.origin.y, self.priceWithTipLabel.frame.size.width, self.priceWithTipLabel.frame.size.height)
    }
    override func viewDidAppear(animated: Bool) {
        
        //reading from settings
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("percentage1") != nil) {
            percentage1 = defaults.objectForKey("percentage1") as! String
            percentage2 = defaults.objectForKey("percentage2") as! String
            percentage3 = defaults.objectForKey("percentage3") as! String
        }
        
        
        
        //setting labels texts from percentage stored in settings or default ones if first time
        tipControl.setTitle("\(percentage1)%" as String, forSegmentAtIndex: 0)
        tipControl.setTitle("\(percentage2)%" as String, forSegmentAtIndex: 1)
        tipControl.setTitle("\(percentage3)%" as String, forSegmentAtIndex: 2)
        
    self.onEditingChanged(self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //transforming value from String to Double
        let percentage1Double: Double = percentage1.doubleValue/100
        let percentage2Double: Double = percentage2.doubleValue/100
        let percentage3Double: Double = percentage3.doubleValue/100
        
        //updating total bill amount while editing bill amounts
        let billAmount = NSString(string: billField.text!).doubleValue
        var tipPercentages = [percentage1Double, percentage2Double, percentage3Double]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        //editing labels formats
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTapOutScreen(sender: AnyObject) {
        view.endEditing(true)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        self.onEditingChanged(self)
        
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        if(currentPage == 1){
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.billLabelSmall.alpha = 1.0
            })
        }
        else{
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.billLabelSmall.alpha = 0.0
            })
        }
    }
    @IBAction func buttonTipsAction(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.scrollView.contentOffset.x += 320
        })
    }
    
    @IBAction func buttonNumAction(sender: AnyObject) {
        self.showOrHideNumKeyboard(true)
    }
    @IBAction func buttonHighAction(sender: AnyObject) {
        if !self.showingBasicKeyboard{
            if self.showingHighKeyboard{
                self.showOrHideNumKeyboard(false)
                self.showingHighKeyboard = false
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    //disappear high buttons
                    self.buttonSin.alpha = 0.0
                    self.buttonCos.alpha = 0.0
                    self.buttonTan.alpha = 0.0
                    self.buttonLn.alpha = 0.0
                    self.buttonLogTen.alpha = 0.0
                    self.buttonSinH.alpha = 0.0
                    self.buttonCosH.alpha = 0.0
                    self.buttonTanH.alpha = 0.0
                    self.buttonEulers.alpha = 0.0
                    self.buttonTripleCube.alpha = 0.0
                    self.buttonTripleRoot.alpha = 0.0
                    
                })
            }
            else{
                self.showOrHideNumKeyboard(false)
                self.showingHighKeyboard = true
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    //disappear high buttons
                    self.buttonSin.alpha = 1.0
                    self.buttonCos.alpha = 1.0
                    self.buttonTan.alpha = 1.0
                    self.buttonLn.alpha = 1.0
                    self.buttonLogTen.alpha = 1.0
                    self.buttonSinH.alpha = 1.0
                    self.buttonCosH.alpha = 1.0
                    self.buttonTanH.alpha = 1.0
                    self.buttonEulers.alpha = 1.0
                    self.buttonTripleCube.alpha = 1.0
                    self.buttonTripleRoot.alpha = 1.0
                })
                
                
            }
        }
        
    }
    @IBAction func buttonBasicAction(sender: AnyObject) {
        if !self.showingHighKeyboard{
            if self.showingBasicKeyboard{
                self.showOrHideNumKeyboard(false)
                self.showingBasicKeyboard = false
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    //disaappear basic buttons
                    self.buttonPlus.alpha = 0.0
                    self.buttonMinus.alpha = 0.0
                    self.buttonDivide.alpha = 0.0
                    self.buttonTimes.alpha = 0.0
                    self.buttonEquals.alpha = 0.0
                    self.buttonPlusOrMinus.alpha = 0.0
                    self.buttonPercentage.alpha = 0.0
                    self.buttonSquareRoot.alpha = 0.0
                    self.buttonMSquared.alpha = 0.0
                })
            }
            else{
                self.showOrHideNumKeyboard(false)
                self.showingBasicKeyboard = true
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    //appear basic buttons
                    self.buttonPlus.alpha = 1.0
                    self.buttonMinus.alpha = 1.0
                    self.buttonDivide.alpha = 1.0
                    self.buttonTimes.alpha = 1.0
                    self.buttonEquals.alpha = 1.0
                    self.buttonPlusOrMinus.alpha = 1.0
                    self.buttonPercentage.alpha = 1.0
                    self.buttonSquareRoot.alpha = 1.0
                    self.buttonMSquared.alpha = 1.0
                    
                })
                
                
            }

        }
    }
    func showOrHideNumKeyboard(senderButtonIsNum: Bool){
        if(senderButtonIsNum){
            if !self.showingNumhKeyboard{
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.showingNumhKeyboard = true
                    self.showingBasicKeyboard = false
                    self.showingHighKeyboard = false

                    //bring buttons off from keyboard
                    self.buttonFive.frame  = CGRectMake(self.buttonFive.frame.origin.x + 400, self.buttonFive.frame.origin.y + 300, self.buttonFive.frame.size.width, self.buttonFive.frame.size.height)
                    self.buttonSix.frame  = CGRectMake(self.buttonSix.frame.origin.x + 400, self.buttonSix.frame.origin.y + 300, self.buttonSix.frame.size.width, self.buttonSix.frame.size.height)
                    self.buttonSeven.frame  = CGRectMake(self.buttonSeven.frame.origin.x + 400, self.buttonSeven.frame.origin.y + 300, self.buttonSeven.frame.size.width, self.buttonSeven.frame.height)
                    self.buttonEight.frame  = CGRectMake(self.buttonEight.frame.origin.x + 400, self.buttonEight.frame.origin.y + 300, self.buttonEight.frame.size.width, self.buttonEight.frame.height)
                    self.buttonNine.frame  = CGRectMake(self.buttonNine.frame.origin.x + 400, self.buttonNine.frame.origin.y + 300, self.buttonNine.frame.size.width, self.buttonNine.frame.height)
                    
                    self.buttonOne.frame  = CGRectMake(self.buttonOne.frame.origin.x + 400, self.buttonOne.frame.origin.y + 300, self.buttonOne.frame.size.width, self.buttonFive.frame.size.height)
                    self.buttonTwo.frame  = CGRectMake(self.buttonTwo.frame.origin.x + 400, self.buttonTwo.frame.origin.y + 300, self.buttonTwo.frame.size.width, self.buttonTwo.frame.size.height)
                    self.buttonThree.frame  = CGRectMake(self.buttonThree.frame.origin.x + 400, self.buttonThree.frame.origin.y + 300, self.buttonThree.frame.size.width, self.buttonThree.frame.height)
                    self.buttonFour.frame  = CGRectMake(self.buttonFour.frame.origin.x + 400, self.buttonFour.frame.origin.y + 300, self.buttonFour.frame.size.width, self.buttonFour.frame.height)
                    
                    self.buttonZero.frame  = CGRectMake(self.buttonZero.frame.origin.x + 400, self.buttonZero.frame.origin.y + 300, self.buttonZero.frame.size.width, self.buttonZero.frame.size.height)
                    self.buttonC.frame  = CGRectMake(self.buttonC.frame.origin.x + 400, self.buttonC.frame.origin.y + 300, self.buttonC.frame.size.width, self.buttonC.frame.size.height)
                    self.buttonPeriod.frame  = CGRectMake(self.buttonPeriod.frame.origin.x + 400, self.buttonPeriod.frame.origin.y + 300, self.buttonPeriod.frame.size.width, self.buttonPeriod.frame.height)
                    self.buttonPeriodLarge.frame  = CGRectMake(self.buttonPeriodLarge.frame.origin.x + 400, self.buttonPeriodLarge.frame.origin.y + 300, self.buttonPeriodLarge.frame.size.width, self.buttonPeriodLarge.frame.height)
                    
                    self.buttonPlus.alpha = 0.0
                    self.buttonMinus.alpha = 0.0
                    self.buttonDivide.alpha = 0.0
                    self.buttonTimes.alpha = 0.0
                    self.buttonEquals.alpha = 0.0
                    self.buttonPlusOrMinus.alpha = 0.0
                    self.buttonPercentage.alpha = 0.0
                    self.buttonSquareRoot.alpha = 0.0
                    self.buttonMSquared.alpha = 0.0
                    self.buttonSin.alpha = 0.0
                    self.buttonCos.alpha = 0.0
                    self.buttonTan.alpha = 0.0
                    self.buttonLn.alpha = 0.0
                    self.buttonLogTen.alpha = 0.0
                    self.buttonSinH.alpha = 0.0
                    self.buttonCosH.alpha = 0.0
                    self.buttonTanH.alpha = 0.0
                    self.buttonEulers.alpha = 0.0
                    self.buttonTripleCube.alpha = 0.0
                    self.buttonTripleRoot.alpha = 0.0


                })
                
            }
        }
        else{
            if !self.showingNumhKeyboard{
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.showingNumhKeyboard = true
                    
                    //bring buttons off from keyboard
                    self.buttonFive.frame  = CGRectMake(self.buttonFive.frame.origin.x + 400, self.buttonFive.frame.origin.y + 300, self.buttonFive.frame.size.width, self.buttonFive.frame.size.height)
                    self.buttonSix.frame  = CGRectMake(self.buttonSix.frame.origin.x + 400, self.buttonSix.frame.origin.y + 300, self.buttonSix.frame.size.width, self.buttonSix.frame.size.height)
                    self.buttonSeven.frame  = CGRectMake(self.buttonSeven.frame.origin.x + 400, self.buttonSeven.frame.origin.y + 300, self.buttonSeven.frame.size.width, self.buttonSeven.frame.height)
                    self.buttonEight.frame  = CGRectMake(self.buttonEight.frame.origin.x + 400, self.buttonEight.frame.origin.y + 300, self.buttonEight.frame.size.width, self.buttonEight.frame.height)
                    self.buttonNine.frame  = CGRectMake(self.buttonNine.frame.origin.x + 400, self.buttonNine.frame.origin.y + 300, self.buttonNine.frame.size.width, self.buttonNine.frame.height)
                    
                    self.buttonOne.frame  = CGRectMake(self.buttonOne.frame.origin.x + 400, self.buttonOne.frame.origin.y + 300, self.buttonOne.frame.size.width, self.buttonFive.frame.size.height)
                    self.buttonTwo.frame  = CGRectMake(self.buttonTwo.frame.origin.x + 400, self.buttonTwo.frame.origin.y + 300, self.buttonTwo.frame.size.width, self.buttonTwo.frame.size.height)
                    self.buttonThree.frame  = CGRectMake(self.buttonThree.frame.origin.x + 400, self.buttonThree.frame.origin.y + 300, self.buttonThree.frame.size.width, self.buttonThree.frame.height)
                    self.buttonFour.frame  = CGRectMake(self.buttonFour.frame.origin.x + 400, self.buttonFour.frame.origin.y + 300, self.buttonFour.frame.size.width, self.buttonFour.frame.height)
                    
                    self.buttonZero.frame  = CGRectMake(self.buttonZero.frame.origin.x + 400, self.buttonZero.frame.origin.y + 300, self.buttonZero.frame.size.width, self.buttonZero.frame.size.height)
                    self.buttonC.frame  = CGRectMake(self.buttonC.frame.origin.x + 400, self.buttonC.frame.origin.y + 300, self.buttonC.frame.size.width, self.buttonC.frame.size.height)
                    self.buttonPeriod.frame  = CGRectMake(self.buttonPeriod.frame.origin.x + 400, self.buttonPeriod.frame.origin.y + 300, self.buttonPeriod.frame.size.width, self.buttonPeriod.frame.height)
                    self.buttonPeriodLarge.frame  = CGRectMake(self.buttonPeriodLarge.frame.origin.x + 400, self.buttonPeriodLarge.frame.origin.y + 300, self.buttonPeriodLarge.frame.size.width, self.buttonPeriodLarge.frame.height)
                    
                })
                
            }
            else{
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.showingNumhKeyboard = false
                    //bring buttons off from keyboard
                    self.buttonFive.frame  = CGRectMake(self.buttonFive.frame.origin.x - 400, self.buttonFive.frame.origin.y - 300, self.buttonFive.frame.size.width, self.buttonFive.frame.size.height)
                    self.buttonSix.frame  = CGRectMake(self.buttonSix.frame.origin.x - 400, self.buttonSix.frame.origin.y - 300, self.buttonSix.frame.size.width, self.buttonSix.frame.size.height)
                    self.buttonSeven.frame  = CGRectMake(self.buttonSeven.frame.origin.x - 400, self.buttonSeven.frame.origin.y - 300, self.buttonSeven.frame.size.width, self.buttonSeven.frame.height)
                    self.buttonEight.frame  = CGRectMake(self.buttonEight.frame.origin.x - 400, self.buttonEight.frame.origin.y - 300, self.buttonEight.frame.size.width, self.buttonEight.frame.height)
                    self.buttonNine.frame  = CGRectMake(self.buttonNine.frame.origin.x - 400, self.buttonNine.frame.origin.y - 300, self.buttonNine.frame.size.width, self.buttonNine.frame.height)
                    
                    self.buttonOne.frame  = CGRectMake(self.buttonOne.frame.origin.x - 400, self.buttonOne.frame.origin.y - 300, self.buttonOne.frame.size.width, self.buttonFive.frame.size.height)
                    self.buttonTwo.frame  = CGRectMake(self.buttonTwo.frame.origin.x - 400, self.buttonTwo.frame.origin.y - 300, self.buttonTwo.frame.size.width, self.buttonTwo.frame.size.height)
                    self.buttonThree.frame  = CGRectMake(self.buttonThree.frame.origin.x - 400, self.buttonThree.frame.origin.y - 300, self.buttonThree.frame.size.width, self.buttonThree.frame.height)
                    self.buttonFour.frame  = CGRectMake(self.buttonFour.frame.origin.x - 400, self.buttonFour.frame.origin.y - 300, self.buttonFour.frame.size.width, self.buttonFour.frame.height)
                    
                    self.buttonZero.frame  = CGRectMake(self.buttonZero.frame.origin.x - 400, self.buttonZero.frame.origin.y - 300, self.buttonZero.frame.size.width, self.buttonZero.frame.size.height)
                    self.buttonC.frame  = CGRectMake(self.buttonC.frame.origin.x - 400, self.buttonC.frame.origin.y - 300, self.buttonC.frame.size.width, self.buttonC.frame.size.height)
                    self.buttonPeriod.frame  = CGRectMake(self.buttonPeriod.frame.origin.x - 400, self.buttonPeriod.frame.origin.y - 300, self.buttonPeriod.frame.size.width, self.buttonPeriod.frame.height)
                    self.buttonPeriodLarge.frame  = CGRectMake(self.buttonPeriodLarge.frame.origin.x - 400, self.buttonPeriodLarge.frame.origin.y - 300, self.buttonPeriodLarge.frame.size.width, self.buttonPeriodLarge.frame.height)
                    
                })
            }

        }
    }
    @IBAction func buttonMSquaredAction(sender: AnyObject) {
        self.buttonBasicAction(self)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(numTyped! * numTyped!)"
        }
    }
    @IBAction func buttonPercentageAction(sender: AnyObject) {
        self.buttonBasicAction(self)
        let numTyped = Double(self.billField.text!)
        if (numTyped != nil){
            self.billField.text! = "\((numTyped!)/100)"
        }
    }
    

    @IBAction func buttonSquareRootAction(sender: AnyObject) {
        self.buttonBasicAction(self)
        let numTyped = Double(self.billField.text!)
        if (numTyped != nil){
            self.billField.text! = "\(sqrt(numTyped!))"
        }
    }
    @IBAction func buttonPlusOrMinusAction(sender: AnyObject) {
        self.buttonBasicAction(self)
        let numTyped = Double(self.billField.text!)
        if (numTyped != nil){
            self.billField.text! = "-\(numTyped!)"
        }
    }
    @IBAction func buttonPlusAction(sender: AnyObject) {
        if(self.operationStack == "no operation"){
            self.buttonBasicAction(self)
            let numTyped = Double(self.billField.text!)
            if (numTyped != nil){
                let num = numTyped!
                print(num)
                stackCalc.append(num)
                operationStack = "plus"
                self.billField.text! = ""
            }

        }
    }
    @IBAction func buttonEqualsAction(sender: AnyObject) {
        self.buttonBasicAction(self)
        print(stackCalc.count)
        if ((stackCalc.count == 0) || (stackCalc.isEmpty)){
            self.billField.text! = ""
        }
        else if (!stackCalc.isEmpty) {
            let numTyped = Double(self.billField.text!)
            if (numTyped != nil){
                let num = numTyped!
                stackCalc.append(num)
            }

            switch operationStack{
            case "plus":
                self.billField.text! = "\(stackCalc[0] + stackCalc [1])"
            case "minus":
                self.billField.text! = "\(stackCalc[0] - stackCalc [1])"
            case "divide":
                self.billField.text! = "\(stackCalc[0] / stackCalc [1])"
            case "times":
                self.billField.text! = "\(stackCalc[0] * stackCalc [1])"
                
            default:
                print("default case")
                
            }
            stackCalc.removeAll()
        }
        else{
            //wrong operation
            self.billField.text! = ""
            stackCalc.removeAll()
        }
        self.operationStack = "no operation"

    
    }
    @IBAction func buttonTimesAction(sender: AnyObject) {
        if(self.operationStack == "no operation"){
            self.buttonBasicAction(self)
            let numTyped = Double(self.billField.text!)
            if (numTyped != nil){
                let num = numTyped!
                print(num)
                stackCalc.append(num)
                operationStack = "times"
                self.billField.text! = ""
            }
        }
    

    }
    @IBAction func buttonDivideAction(sender: AnyObject) {
        if(self.operationStack == "no operation"){
            self.buttonBasicAction(self)
            let numTyped = Double(self.billField.text!)
            if (numTyped != nil){
                let num = numTyped!
                print(num)
                stackCalc.append(num)
                operationStack = "divide"
                self.billField.text! = ""
            }

        }

    }
    @IBAction func buttonMinusAction(sender: AnyObject) {
        if(self.operationStack == "no operation"){
            self.buttonBasicAction(self)
            let numTyped = Double(self.billField.text!)
            if (numTyped != nil){
                let num = numTyped!
                print(num)
                stackCalc.append(num)
                operationStack = "minus"
                self.billField.text! = ""
            }
        }
       
    }
    @IBAction func buttonSinHAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(sinh(numTyped!*M_PI/180))"
        }
    }
    @IBAction func buttonTripleRoorAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(pow(numTyped!, 1.0/3))"
        }

    }
    @IBAction func buttonTripleCubeAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(pow(numTyped!, 3.0))"
        }
    }
    @IBAction func buttonEulersAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(pow(M_E,numTyped!))"
        }

    }
    @IBAction func buttonCosHAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(cosh(numTyped!))"
        }
    }
    @IBAction func buttonTanHAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(tanh(numTyped!))"
        }

    }
    @IBAction func buttonLogTenAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(log(numTyped!)/log(10)))"
        }

    }
    @IBAction func buttonTanAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(tan(numTyped!*M_PI/180))"
        }
    }
    @IBAction func buttonSinAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(sin(numTyped!*M_PI/180))"
        }

        
    }
    @IBAction func buttonCosAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(cos(numTyped!*M_PI/180))"
        }

    }
    @IBAction func buttonLnAction(sender: AnyObject) {
        self.buttonHighAction(false)
        let numTyped = Double(self.billField.text!)
        if (numTyped != 0){
            self.billField.text! = "\(log(numTyped!))"
        }

    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("toque")
    }
}







