//
//  ViewController.swift
//  PreWork
//
//  Created by lester on 7/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    var tipPercentages = [0.15, 0.18, 0.2]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Sets the title in the navigation Bar
        self.title = "Tip Caluclator"
    }


    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip by multiplying bill * tip Percentage
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip amount label
        tipAmountLabel.text = String(format: "%.2f", tip)
        //Update Total amount
        totalLabel.text = String(format: "%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        
        let tip1 = defaults.string(forKey: "tip1") ?? "15"
        tipControl.setTitle(tip1 + "%", forSegmentAt: 0)
        tipPercentages[0] = (Double(tip1) ?? 15) / 100;
        
        let tip2 = defaults.string(forKey: "tip2") ?? "18"
        tipControl.setTitle(tip2 + "%", forSegmentAt: 1)
        tipPercentages[1] = (Double(tip2) ?? 18) / 100;
        
        let tip3 = defaults.string(forKey: "tip3") ?? "20"
        tipControl.setTitle(tip3 + "%", forSegmentAt: 2)
        tipPercentages[2] = (Double(tip3) ?? 20) / 100;
        
    }
}

