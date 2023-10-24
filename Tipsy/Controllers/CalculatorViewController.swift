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
    
    var bill = 123.56
    var tip = 10.0
    var numberOfPeople = 2
    var finalResult = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tip = Double(sender.titleLabel?.text?.dropLast() ?? "\(tip)") ?? tip
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billResult = Double(billTextField.text ?? "\(bill)") ?? bill
        let billWithTipResult = billResult + billResult * tip / 100
        finalResult = billWithTipResult / Double(numberOfPeople)
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResults" else { return }
        
        let destinationVC = segue.destination as? ResultsViewController
        destinationVC?.result = String(format: "%.2f", finalResult)
        destinationVC?.numberOfPeople = numberOfPeople
        destinationVC?.tip = "\(tip)%"
    }
}

