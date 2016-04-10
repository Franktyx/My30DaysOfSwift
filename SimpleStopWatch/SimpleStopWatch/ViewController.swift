//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Yuxiang Tang on 4/9/16.
//  Copyright © 2016 Yuxiang Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
    
    var timeLabel: UILabel!
    var startButton: UIButton!
    var stopButton: UIButton!
    var resetButton: UIButton!
    
    var isPlaying = false
    
    var timeValue: Double! = 0.0
    
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelInit()
        
        
        
    }
    
    func labelInit(){
        self.timeLabel = UILabel()
        self.timeLabel.frame = CGRectMake(0, 0, self.screenWidth, self.screenHeight/3)
        self.timeLabel.backgroundColor = UIColor.blackColor()
        self.timeLabel.textColor = UIColor.whiteColor()
        self.timeLabel.text = String(self.timeValue)
        self.timeLabel.textAlignment = .Center
        self.timeLabel.font = UIFont.systemFontOfSize(45)
        self.timeLabel.userInteractionEnabled = false
        self.view.addSubview(self.timeLabel)
        
        self.startButton = UIButton()
        self.startButton.frame = CGRectMake(0, self.screenHeight/3, self.screenWidth/2, self.screenHeight*2/3)
        self.startButton.backgroundColor = UIColor(red: 68/255, green: 206/255, blue: 246/255, alpha: 1.0)
        self.startButton.setTitle("Start", forState: UIControlState.Normal)
        self.startButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.startButton.addTarget(self, action: "startTouchDown:", forControlEvents: UIControlEvents.TouchDown)
        self.startButton.addTarget(self, action: "startTouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(self.startButton)
        
        self.stopButton = UIButton()
        self.stopButton.frame = CGRectMake(self.screenWidth/2, self.screenHeight/3, self.screenWidth/2, self.screenHeight*2/3)
        self.stopButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.stopButton.setTitle("Stop", forState: UIControlState.Normal)
        self.stopButton.backgroundColor = UIColor(red: 164/255, green: 226/255, blue: 198/255, alpha: 1.0)
        self.stopButton.addTarget(self, action: "stopTouchDown:", forControlEvents: UIControlEvents.TouchDown)
        self.stopButton.addTarget(self, action: "stopTouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.stopButton)
        
        self.resetButton = UIButton()
        self.resetButton.frame = CGRectMake(self.screenWidth - 80, 25, 60, 30)
        self.resetButton.setTitle("RESET", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.resetButton.addTarget(self, action: "resetTime:", forControlEvents: UIControlEvents.TouchDown)
        self.resetButton.userInteractionEnabled = true
        self.view.addSubview(self.resetButton)
        
    }
    

    func startTouchDown(sender: UIButton) {
        
        if self.isPlaying {
            return
        }
        
        self.isPlaying = true
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        
        sender.backgroundColor = UIColor(red: 68/255, green: 206/255, blue: 246/255, alpha: 0.5)
        
    }
    
    func startTouchUpInside(sender: UIButton) {
        print("touch up inside")
        sender.backgroundColor = UIColor(red: 68/255, green: 206/255, blue: 246/255, alpha: 1.0)
    }
    
    func stopTouchDown(sender: UIButton){
        if self.isPlaying==false {
            return
        }
        self.timer.invalidate()
        self.isPlaying = false
        sender.backgroundColor = UIColor(red: 164/255, green: 226/255, blue: 198/255, alpha: 0.5)
    }
    
    func stopTouchUpInside(sender: UIButton){
        sender.backgroundColor = UIColor(red: 164/255, green: 226/255, blue: 198/255, alpha: 1.0)
    }
    
    func updateTime(){
        self.timeValue = self.timeValue + 0.1
        self.timeLabel.text = String(format: "%.1f", self.timeValue)
    }
    
    func resetTime(sender: UIButton){
        print("hehe")
        if self.isPlaying==false {
            self.timeValue = 0.0
            self.timeLabel.text = String(format: "%.1f", self.timeValue)

        }
    }

}

