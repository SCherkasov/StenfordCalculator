//
//  ViewController.swift
//  StenfordCalculator
//
//  Created by Stanislav Cherkasov on 30.11.17.
//  Copyright © 2017 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
        
        let textCurrentlyInDisplay = display.text!
        display.text! = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }

    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set {
           display.text! = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "pi":
                displayValue = Double.pi
                case "√":
                    let operand = Double(display.text!)!
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }

}

