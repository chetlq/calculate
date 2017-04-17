//
//  ViewController.swift
//  Myprod
//
//  Created by admin on 3/28/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var itmot:Bool = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view is loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buttonchik(_ sender: UIButton) {
        let digit = sender.currentTitle!
        var display = displayLabel.text
        if itmot {
            displayLabel.text = display! + digit
        }
        else {
            displayLabel.text = digit
            itmot = true
        
        }
        
    }
    
    var displayValue:Double{
        get{
           return Double(displayLabel.text!)!
        
        }
        set{
            displayLabel.text = String(newValue)
        }
    
    }
    
    var brain = CalculateBrain()


    @IBAction func pibutton(_ sender: UIButton) {
        if itmot{
            brain.setOperand(operand: displayValue)
        }
        if let mathSymbol = sender.currentTitle{
            brain.perfomOperation(symbol: mathSymbol)
            itmot = false
//            if mathSymbol == "π" {
//                displayValue =  M_PI
//            }
//            else if mathSymbol == "√" {
//                displayValue =  sqrt(displayValue)
//            }

        }
        displayValue = brain.result
    }

}

