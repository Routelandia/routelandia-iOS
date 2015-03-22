//
//  ViewController.swift
//  Routelandia
//
//  Created by LOC LE on 3/20/15.
//  Copyright (c) 2015 Routelandia. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let searchRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 45.509534, longitude: -122.681081)
        centerMapOnLocation(initialLocation)
    }
    
    @IBAction func zoomIn(sender: AnyObject) {
    }
    
    
    @IBAction func changeMapType(sender: AnyObject) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            searchRadius * 22.0, searchRadius * 22.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    

}

