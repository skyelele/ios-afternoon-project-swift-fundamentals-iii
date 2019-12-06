//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    var currency : currency = .cad

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let userInput = Double(fromCurrencyTextField.text!) else {
            return
        }
        fromCurrencyTextField.text = String(convert(userInput))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        if cadButton.isSelected == true {
            cadButton.isSelected = false
        } else {
            cadButton.isSelected = true
        }
        
        if mxnButton.isSelected == true {
            cadButton.isSelected = false
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            cadButton.isSelected = true
        }

    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        if mxnButton.isSelected == true {
            mxnButton.isSelected = false
        } else {
            mxnButton.isSelected = true
        }
        
        if cadButton.isSelected == true {
            mxnButton.isSelected = false
            currency = .cad
            toCurrencyLabel.text = "Currency (MXN)"
        } else {
            mxnButton.isSelected = true
        }
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        if currency == .cad {

            return (dollars * 1.33)
        } else {
            return (dollars * 19.70)
        }
    }
}

