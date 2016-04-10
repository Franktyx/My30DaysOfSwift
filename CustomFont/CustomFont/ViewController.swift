//
//  ViewController.swift
//  CustomFont
//
//  Created by Yuxiang Tang on 4/10/16.
//  Copyright © 2016 Yuxiang Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
    var textLabel: UILabel!
    
    var fontState = 0
    
    var changeFontButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        self.navigationItem.title = "Custom Fonts"
        self.navigationController?.navigationBar.barTintColor = UIColor.brownColor()
        
        
        self.textLabel = UILabel()
        self.textLabel.frame = CGRectMake(self.screenWidth/2 - 200, 100, 400, 500)
        self.view.addSubview(self.textLabel)
        
        self.textLabel.text = "初来乍到，请多指教！"
        self.textLabel.font = UIFont(name: "MFJinHei_Noncommercial-Regular", size: 30)
        self.textLabel.textAlignment = .Center
        
        self.changeFontButton = UIButton()
        self.changeFontButton.frame = CGRectMake(self.screenWidth/2 - 50, self.screenHeight - 100, 100, 100)
        self.changeFontButton.layer.cornerRadius = 50
        self.changeFontButton.clipsToBounds = true
        self.changeFontButton.layer.borderWidth = 3
        self.changeFontButton.backgroundColor = UIColor.yellowColor()
        self.changeFontButton.setTitle("Change", forState: UIControlState.Normal)
        self.changeFontButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(self.changeFontButton)
        self.changeFontButton.addTarget(self, action: "changeFont:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func changeFont(sender: UIButton){
        switch fontState {
        case 0:
            self.textLabel.font = UIFont(name: "MFTongXin_Noncommercial-Regular", size: 30)
            fontState = 1
        case 1:
            self.textLabel.font = UIFont(name: "MFZhiHei_Noncommercial-Regular", size: 30)
            fontState = 2
        case 2:
            self.textLabel.font = UIFont(name: "MFJinHei_Noncommercial-Regular", size: 30)
            fontState = 0
        default:
            return
        }
    }

    
    


}

