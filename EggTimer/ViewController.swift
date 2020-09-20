//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    
    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func durezzaSelezionata(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0
        
        let hardness = sender.currentTitle
        
        print(eggTime[hardness!]!)
        
        
        //        --->> Il codice sottostante è identico alla riga qui sopra <<---
        
        //        if hardness == "Soft" {
        //            print(eggTime["Soft"]!)
        //        } else if hardness == "Medium" {
        //            print(eggTime["Medium"]!)
        //        } else if hardness == "Hard" {
        //            print(eggTime["Hard"]!)
        //        }
        
        var secondsRemaining = 60*eggTime[hardness!]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
                self.countDownLabel.text = String(secondsRemaining)  // Il numero viene visualizzato sullo schermo con il countdown
                self.progressBar.progress = Float(secondsRemaining) / Float(60*self.eggTime[hardness!]!)
            } else {
                self.timer.invalidate()
                self.countDownLabel.text = "E'prontoo!"
            }
        }
        
        
        
    }
}
