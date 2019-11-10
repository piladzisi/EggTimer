//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var doneLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    let eggTimesArray = ["Soft": 2, "Medium": 4, "Hard": 7]
    var totalCookingTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var secondsInOneMinute = 60
    
    
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
            playSound(soundName: "alarm_sound")
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        timer.invalidate()
        secondsPassed = 0
        progressBar.progress = 0.0
        doneLabel.text = "How do you like your eggs?"
        
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
}
