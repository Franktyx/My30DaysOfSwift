//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Yuxiang Tang on 4/11/16.
//  Copyright © 2016 Yuxiang Tang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
    var mainTableView: UITableView!
    var identifier = "cell"
    
    var playerViewController: AVPlayerViewController!
    var playerView: AVPlayer!
    

    var data = [
        video(image: "screenshot-1", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "screenshot-2", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "screenshot-3", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "screenshot-4", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "screenshot-5", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "screenshot-6", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Local Videos"
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGrayColor()
        
        var frame = CGRectMake(0, 0, self.screenWidth, self.screenHeight)
        
        self.mainTableView = UITableView(frame: frame, style: .Plain)
        
        self.mainTableView.registerClass(MyTableViewCell.self, forCellReuseIdentifier: self.identifier)
        
        self.view.addSubview(self.mainTableView)
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
        
        self.playerViewController = AVPlayerViewController()
        self.playerView = AVPlayer()
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.identifier, forIndexPath: indexPath) as! MyTableViewCell
                
        cell.backgroundImageView.image = UIImage(named: self.data[indexPath.row].image)
        cell.videoName.text = self.data[indexPath.row].title
        cell.videoDis.text = self.data[indexPath.row].source
        
        cell.playButton.addTarget(self, action: #selector(ViewController.playVideo(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    func playVideo(sender: AnyObject){
        
    
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        
        self.playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        
        playerViewController.player = playerView
        
        self.presentViewController(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
        
    }
    
    

}

