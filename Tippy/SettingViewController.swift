//
//  SettingViewController.swift
//  Tippy
//
//  Created by Shang Wu on 8/21/17.
//  Copyright © 2017 Shang Wu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    let dict = UserDefaults.standard
    @IBOutlet weak var defaultTipPars: UISegmentedControl!

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var dictSelIndex = dict.integer(forKey: "tipParIndex")
        if (dictSelIndex != 0) {
            dictSelIndex -= 1
            if (dictSelIndex != defaultTipPars.selectedSegmentIndex) {
                defaultTipPars.selectedSegmentIndex = dictSelIndex
            }
        }
    }
    
    @IBAction func setDefaultTipPar(_ sender: Any) {
        dict.set(1 + defaultTipPars.selectedSegmentIndex, forKey: "tipParIndex")
        dict.synchronize()
    }
}
