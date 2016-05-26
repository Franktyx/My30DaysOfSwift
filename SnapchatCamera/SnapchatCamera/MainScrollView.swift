//
//  MainScrollView.swift
//  SnapchatCamera
//
//  Created by Yuxiang Tang on 4/12/16.
//  Copyright © 2016 Yuxiang Tang. All rights reserved.
//

import UIKit
import Foundation

class MainScrollView: UIViewController {
    
    
    var mainScrollView: UIScrollView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainScrollView = UIScrollView()
        self.mainScrollView.frame = self.view.frame
        
        self.view.addSubview(self.mainScrollView)
        
        let v1 = View1()
        let v2 = View2()
        let v3 = View3()
        
        self.addChildViewController(v1)
        self.mainScrollView.addSubview(v1.view)
        v1.didMoveToParentViewController(self)
        
        self.addChildViewController(v2)
        self.mainScrollView.addSubview(v2.view)
        v2.didMoveToParentViewController(self)
        
        self.addChildViewController(v3)
        self.mainScrollView.addSubview(v3.view)
        v3.didMoveToParentViewController(self)
        
        var v2Frame : CGRect = v2.view.frame
        v2Frame.origin.x = self.view.frame.width
        v2.view.frame = v2Frame
        
        var v3Frame : CGRect = v3.view.frame
        v3Frame.origin.x = self.view.frame.width * 2
        v3.view.frame = v3Frame
        
        self.mainScrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.height)
        
    }
    
    
    
}