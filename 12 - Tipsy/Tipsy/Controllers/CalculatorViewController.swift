//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numOfPeople = 2.0
    var billAmount = 0.0
    var finalAmount: String = ""
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numOfPeople = Double(sender.value)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = Double(String(sender.currentTitle!.dropLast()))!
        tip = buttonTitle / 100
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        billAmount = Double(billTextField.text ?? "0.0") ?? 0.0
        let finalAmountWithDecimal = (billAmount + (billAmount * tip)) / numOfPeople
        finalAmount = String(format: "%.2f", finalAmountWithDecimal)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.totalval = finalAmount
        destinationVC.people = String(format: "%.0f", numOfPeople)
        destinationVC.tipPct = String(format: "%.0f", tip * 100)
    }

}

