//
//  ViewController.swift
//  tipscalculator
//
//  Created by jakub skrzypczynski on 23/02/2017.
//  Copyright © 2017 test project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var tipPrecentageSlider: UISlider!
    
    @IBOutlet weak var tipPercentageLbl: UILabel!
    
    @IBOutlet weak var ThreeWaySlider: UISlider!
    
    @IBOutlet weak var tipLbl: UILabel!
    
    @IBOutlet weak var totalLbl: UILabel!
    
    
    @IBOutlet weak var splitToPay: UILabel!
    
    @IBOutlet weak var way3Label: UILabel!
    
    @IBAction func billAmountWasChanged(_ sender: Any) {
        setTipCalculation()
        updateUI()
    }
    
    @IBAction func tipPrecentageDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        setTipCalculation()
        updateUI()
    }
    
    @IBAction func splitAmountDidChange(_ sender: UISlider) {
        
        let equalValue = round(sender.value)
        sender.value = equalValue
        setcalculateSplitValue()
        updateUI()
        
    }
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0, numberPeople: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTipCalculation()
        updateUI()
        way3Label.text = String("3-way-split")
        
        
        
        
    }

    func setTipCalculation(){
        tip.tipPercent = Double(tipPrecentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }

    func updateUI() {
        tipLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPrecentageSlider.value * 100))%"
        splitToPay.text = String(format: "$%0.2f", tip.splitToPay)
        let labelText = ThreeWaySlider.value
        way3Label.text = String(format: "Split in %0.0f", labelText)
        print(labelText)
    }

    
        
    func setcalculateSplitValue() {
    tip.numberPeople = Double(ThreeWaySlider.value)
    tip.calculateSplit()
        
    }
    
    
    
}

