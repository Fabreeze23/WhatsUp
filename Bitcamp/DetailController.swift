//
//  DetailController.swift
//  Bitcamp
//
//  Created by Dakota Murray on 4/10/15.
//  Copyright (c) 2015 Dakota Murray. All rights reserved.
//

class DetailController: UIViewController {
    
    private let TAG = "DetailController"
    
    private let START_LAT = 38.9875
    private let START_LONG = 76.9400
    
    
    /**

    */
    override func viewDidLoad() {
        Logger.log(TAG, message: "\(__FUNCTION__)")
        
        var camera = GMSCameraPosition.cameraWithLatitude(START_LAT,
            longitude: START_LONG, zoom: 6)
        
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        
        mapView.myLocationEnabled = true
        self.view = mapView
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "University of Maryland, College Park"
        marker.snippet = "Maryland"
        marker.map = mapView
    }
}
