//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var doneLabel: UILabel!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var seconds = 0
    var timer = Timer()
    var secondsInMinute = 1
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        seconds = eggTimes[hardness]! * secondsInMinute
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if seconds > 0 {
        print("\(seconds) seconds.")
            seconds -= 1
        }
        else {
            timer.invalidate()
            doneLabel.text = "DONE!"
        }
    }
    
}
