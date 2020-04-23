//
//  ViewController.swift
//  Tipsy
//
//  Created by Andrae Henry on 03/22/2020.
//  Copyright © 2020 Andrae Henry. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var percentage : String = ""
    var peopleNum : Int = 0
    var percentageNum : Double = 0.0
    var billPreSplit : Double = 0.0
    var totalPerPerson : Double = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
       if sender.isSelected {
            return
        }
       else {

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        percentage = sender.currentTitle!
        billTextField.endEditing(true)

        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        peopleNum = Int(sender.value)
        splitNumberLabel.text = String(peopleNum)
         billTextField.endEditing(true)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if percentage == "0%"{
            percentageNum = 0.0
            print(0.0)
        }
        else if percentage == "10%"{
            print(0.1)
            percentageNum = 0.1
        }
        else if percentage == "20%"{
            percentageNum = 0.2
            print(0.2)
        }
        print(peopleNum)
        
        
        if billTextField.text != "" {
            billPreSplit = Double(billTextField.text!)!
       print(billPreSplit)
        }
        else {
            billTextField.text = "0.0"
        }
        
      
         billTextField.endEditing(true)
        totalPerPerson = ((percentageNum * billPreSplit) + billPreSplit) / Double(peopleNum)
        print(totalPerPerson)
          performSegue(withIdentifier: "goToResults", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "goToResults" {
        
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.percentageNum = Int(percentageNum * 100)
        destinationVC.peopleNum = peopleNum
        destinationVC.totalPerPerson = totalPerPerson
    }
}
}
