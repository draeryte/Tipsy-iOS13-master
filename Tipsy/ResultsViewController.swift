//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Andrae Henry on 4/22/20.
//  Copyright © 2020 Andrae Henry. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
   
    var percentageNum : Int = 0
    var totalPerPerson: Double = 0.0
    var peopleNum : Int = 0
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalPerPerson)
        settingsLabel.text = ("Split between \(String(peopleNum)) people, with \(String(percentageNum))% tip.)")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print(totalPerPerson)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
