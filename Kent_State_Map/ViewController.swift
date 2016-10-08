//
//  ViewController.swift
//  Kent_State_Map
//
//  Created by Omer Al-Madani on 10/8/16.
//  Copyright © 2016 Omer Al-Madani. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 41.148826, longitude: -81.341648, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 41.148826, longitude: -81.341648)
        marker.title = "Kent State"
        marker.snippet = "Kent State"
        marker.map = mapView
        
        let sModY: Double = 0.01260;        let sModX: Double = 0.010    // Scale modifiers for X and Y axis
        let tModY: Double = 0.000286;       let tModX: Double = 0.0040   // Transform modifiers for X and Y axis
        
        let  latN: Double = 41.1701;        let latS: Double = 41.1245
        let  lonE: Double = -81.3102;       let lonW: Double = -81.3785
        
        let southWest = CLLocationCoordinate2D(latitude: latS + sModY + tModY, longitude: lonW + sModX + tModX)
        let northEast = CLLocationCoordinate2D(latitude: latN - sModY + tModY, longitude: lonE - sModX + tModX)
        
        let overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)
        
        let icon = UIImage(named: "Kent_State_A1_4k.png")
        
        let overlay = GMSGroundOverlay(bounds: overlayBounds, icon: icon)
        overlay.bearing = 0
        overlay.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

