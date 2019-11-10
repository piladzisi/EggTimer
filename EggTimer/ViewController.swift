//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var doneLabel: UILabel!
    
    let eggTimesArray = ["Soft": 5, "Medium": 7, "Hard": 12]
    var totalCookingTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var secondsInOneMinute = 1
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalCookingTime = eggTimesArray[hardness]! * secondsInOneMinute
        doneLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalCookingTime  {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalCookingTime)
            
        } else {
            timer.invalidate()
            doneLabel.text = "DONE!"
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        timer.invalidate()
        secondsPassed = 0
        progressBar.progress = 0.0
        doneLabel.text = "How do you like your eggs?"
        
    }
    
    
}
