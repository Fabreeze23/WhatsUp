//
//  DetailController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/10/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

import TwitterKit

class DetailController: UIViewController {
    
    private let TAG = "DetailController"
    
    private let START_LAT = 38.9875
    private let START_LONG = -76.9400
    
    private var loginViewController = UIViewController()
    
    private var mapView: GMSMapView?
    
    
    
    /**
    
    */
    override func viewDidLoad() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        super.viewDidLoad()
        
        
        var backButton = UIBarButtonItem(
            title: "Events",
            style: UIBarButtonItemStyle.Bordered,
            target: self,
            action: "openEvents:")
        
        
        navigationItem.leftBarButtonItem = backButton
        
        var camera = GMSCameraPosition.cameraWithLatitude(START_LAT,
            longitude: START_LONG, zoom: 15)
        
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)

        mapView?.myLocationEnabled = true
        self.view = mapView
        
        drawCircle(START_LAT, long: START_LONG, radius: 100)
    }
    
    
    /**

    */
    func openEvents(sender: UIBarButtonItem) {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
    }
    
    /**
    
    */
    private func drawCircle(lat: Double, long: Double, radius: Double) {
        let circleCenter = CLLocationCoordinate2DMake(lat, long);
        let circ = GMSCircle(position:circleCenter, radius:radius)
        
        circ.fillColor = UIColor(red:225, green:0, blue:0, alpha:0.75)
        circ.strokeColor = UIColor.redColor()
        circ.strokeWidth = 5
        circ.map = self.mapView
    }
    
    
}
