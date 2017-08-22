//
//  ViewController.swift
//  Tippy
//
//  Created by Shang Wu on 8/21/17.
//  Copyright © 2017 Shang Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tipPars = [0.10,0.15,0.20,0.25]
    let dict = UserDefaults.standard
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var selTipPar: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dict.removeObject(forKey: "tipParIndex")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dissmissKeyboard(_ sender: Any) {
        billAmount.resignFirstResponder()
    }
    
    @IBAction func calTip(_ sender: Any) {
        let bill = Double(billAmount.text!)!
        let tip = bill * tipPars[selTipPar.selectedSegmentIndex]
        let total = bill + tip
        dict.set(1 + selTipPar.selectedSegmentIndex, forKey: "tipParIndex")

        tipAmount.text = String(tip)
        totalAmount.text = String(total)
        tipAmount.alpha = 0
        totalAmount.alpha = 0
        billAmount.alpha = 1
        UIView.animate(withDuration: 3, animations: {
            self.tipAmount.alpha = 1
            self.totalAmount.alpha = 1
            self.billAmount.alpha = 0.2
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var dictSelIndex = dict.integer(forKey: "tipParIndex")
        if (dictSelIndex != 0) {
            dictSelIndex -= 1
            if (dictSelIndex != selTipPar.selectedSegmentIndex) {
                selTipPar.selectedSegmentIndex = dictSelIndex
                calTip(animated)
            }
        }
    }
}

