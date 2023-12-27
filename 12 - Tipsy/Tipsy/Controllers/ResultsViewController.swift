//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Fahad Mansuri on 29.05.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalval: String = ""
    var people = "0"
    var tipPct = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalval
        settingsLabel.text = "Split between \(people) people, with \(tipPct)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
