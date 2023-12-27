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
    
    @IBOutlet weak var timerLabel: UILabel!
  
    var totalTime = 0
    
    var timer = Timer()
    var isTimerRunning = false
    
    func runTimer() {
         timer.invalidate()
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if (totalTime > 0){
            totalTime -= 1     //This will decrement(count down)the seconds.
            timerLabel.text = timeString(time: TimeInterval(totalTime)) //This will update the label.
            /*perCompleted = Float(totalTime) / progTime
            progressBar.progress = perCompleted
            print(perCompleted)*/
        }
        else {
            timerLabel.text = "Eggs are ready"
            playSound()
        }
    }
    
    func timeString(time:TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    //playing soun
    var player: AVAudioPlayer?

    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        
        if hardness == "Soft"{
            totalTime = 300
            runTimer()
        }
        else if hardness == "Medium"{
            totalTime = 420
            runTimer()
        }
        else if hardness == "Hard"{
            totalTime = 720
            runTimer()
        }
    }
    

}
