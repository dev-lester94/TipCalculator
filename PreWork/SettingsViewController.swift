//
//  SettingsViewController.swift
//  PreWork
//
//  Created by lester on 7/19/22.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var tip1TextField: UITextField!
    
    @IBOutlet weak var tip2TextField: UITextField!
    
    @IBOutlet weak var tip3TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let tip1 = defaults.string(forKey: "tip1") ?? "15"
        tip1TextField.text = tip1
        
        let tip2 = defaults.string(forKey: "tip2") ?? "18"
        tip2TextField.text = tip2
        
        let tip3 = defaults.string(forKey: "tip3") ?? "20"
        tip3TextField.text = tip3
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        if let tip1 = tip1TextField.text {
            defaults.set(tip1, forKey: "tip1")
        }
        
        if let tip2 = tip2TextField.text {
            defaults.set(tip2, forKey: "tip2")
        }

        if let tip3 = tip3TextField.text{
            defaults.set(tip3, forKey: "tip3")
        }

        defaults.synchronize()
    }
}
