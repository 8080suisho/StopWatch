//
//  ViewController.swift
//  StopWatch
//
//  Created by 諸星水晶 on 2020/08/25.
//  Copyright © 2020 Mizuki Morohoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var hanteiLabel:UILabel!
    var count:Float = 0.0
    var timer:Timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count >= 9.80 && count <= 10.20{
             hanteiLabel.isHidden = false
            hanteiLabel.text = "PERFECT!"
            hanteiLabel.textColor = UIColor.red
        }else if count >= 9.70 && count <= 10.30{
            hanteiLabel.isHidden = false
            hanteiLabel.text = "GREAT!"
            hanteiLabel.textColor = UIColor.orange
        }else if count >= 9.50 && count <= 10.50{
            hanteiLabel.isHidden = false
            hanteiLabel.text = "GOOD!"
            hanteiLabel.textColor = UIColor.green
        }else{
            hanteiLabel.isHidden = false
            hanteiLabel.text = "BAD!"
            hanteiLabel.textColor = UIColor.black
        }
    }
    
    @IBAction func start(){
        hanteiLabel.isHidden = true
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        hanteiLabel.isHidden = true
        if timer.isValid{
            timer.invalidate()
            count = 0.0
            label.text = String(format: "%.1f", count)
        }else if !timer.isValid{
            count = 0.0
            label.text = String(format: "%.1f", count)
        }
    }
    
    


}

