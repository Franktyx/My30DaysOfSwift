//
//  MyTableViewCell.swift
//  PlayLocalVideo
//
//  Created by Yuxiang Tang on 4/11/16.
//  Copyright © 2016 Yuxiang Tang. All rights reserved.
//

import UIKit
import Foundation

class MyTableViewCell: UITableViewCell {
    
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
    var backgroundImageView: UIImageView!
    
    var playButton: UIButton!
    var videoName: UILabel!
    var videoDis: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundImageView = UIImageView()
        self.backgroundImageView.frame = CGRectMake(0, 0, self.screenWidth, 220)
        self.addSubview(self.backgroundImageView)
        
        self.playButton = UIButton()
        self.playButton.frame = CGRectMake(self.screenWidth / 2 - 30, 110.0 - 30.0, 60, 60)
        self.playButton.setBackgroundImage(UIImage(named: "play_button"), forState: UIControlState.Normal)
        self.addSubview(self.playButton)
        
        self.videoName = UILabel()
        self.videoName.frame = CGRectMake(self.screenWidth/2 - 200, self.playButton.frame.origin.y + self.playButton.frame.height + 10, 400, 30)
        self.videoName.font = UIFont.boldSystemFontOfSize(18)
        self.videoName.textAlignment = .Center
        self.videoName.textColor = UIColor.whiteColor()
        self.addSubview(self.videoName)
        
        self.videoDis = UILabel()
        self.videoDis.frame = CGRectMake(self.screenWidth/2 - 200, self.videoName.frame.origin.y + self.videoName.frame.height + 5, 400, 25)
        self.videoDis.font = UIFont.systemFontOfSize(15)
        self.videoDis.textAlignment = .Center
        self.videoDis.textColor = UIColor.yellowColor()
        self.addSubview(self.videoDis)
        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
        
    }
    
}