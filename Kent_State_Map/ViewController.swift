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
        
        //let southWest = CLLocationCoordinate2D(latitude: 41.1245, longitude: -81.3785)
        //let northEast = CLLocationCoordinate2D(latitude: 41.1701, longitude: -81.3102)
        
        //var scaleKey: Float = 10.0//
        
        let southWest = CLLocationCoordinate2D(latitude: 41.1245 + 0.0125 + 0.00028, longitude: -81.3785 + 0.010 + 0.0040)
        let northEast = CLLocationCoordinate2D(latitude: 41.1701 - 0.0125 + 0.00028, longitude: -81.3102 - 0.010 + 0.0040)
        
        //let southWest = CLLocationCoordinate2D(latitude: 41.1245 + 0.0003, longitude: -81.3785 + 0.0040)
        //let northEast = CLLocationCoordinate2D(latitude: 41.1701 + 0.0003, longitude: -81.3102 + 0.0040)
        
        let overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)
        
        let icon = UIImage(named: "Kent_State_A1_4k.png")
        
        let overlay = GMSGroundOverlay(bounds: overlayBounds, icon: icon)
        overlay.bearing = 359
        overlay.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

