//
//  ViewController.swift
//  FindMyLocation
//
//  Created by Yuxiang Tang on 5/25/16.
//  Copyright © 2016 Yuxiang Tang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
    
    var locationLabel: UILabel!
    var findLocationButton: UIButton!
    
    
    func findLocationButtonOnClick(sender: AnyObject) {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationLabel = UILabel()
        self.locationLabel.frame = CGRectMake(0, 50, self.screenWidth, 80)
        self.locationLabel.layer.cornerRadius = 10
        self.locationLabel.textAlignment = .Center
        self.view.addSubview(self.locationLabel)
        self.locationLabel.numberOfLines = 0
        self.locationLabel.backgroundColor = UIColor.lightGrayColor()
        
        self.findLocationButton = UIButton()
        self.findLocationButton.backgroundColor = UIColor.lightGrayColor()
        self.findLocationButton.frame = CGRectMake(self.screenWidth/2 - 80, 350, 160, 80)
        self.view.addSubview(self.findLocationButton)
        self.findLocationButton.addTarget(self, action: "findLocationButtonOnClick:", forControlEvents: .TouchUpInside)
        self.findLocationButton.setTitle("My Location", forState: UIControlState.Normal)
        self.findLocationButton.layer.cornerRadius = 20
        self.findLocationButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("here")
//        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        CLGeocoder().reverseGeocodeLocation(manager.location!){ (placeMarks, error) -> Void in
            
            if (error != nil) {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
//            print(placeMarks?.first?.country)
            
        self.displayLocation(placeMarks?.first)
        
        }
        
    }
    
    func displayLocation(place: CLPlacemark?){
        
        if let containsPlaceMark = place {
            self.locationManager.stopUpdatingLocation()
            
            print(containsPlaceMark.administrativeArea)
            print(containsPlaceMark.locality)
            print(containsPlaceMark.areasOfInterest?.first)
            
            self.locationLabel.text = (containsPlaceMark.areasOfInterest?.first)! + ", " + containsPlaceMark.locality! + ", " + containsPlaceMark.administrativeArea! + ", " + containsPlaceMark.postalCode!
            
        }
        
    }
    
    

    

}

