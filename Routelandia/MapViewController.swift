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
    @IBOutlet weak var nextButton: UIButton!

    let searchRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 45.509534, longitude: -122.681081)
        centerMapOnLocation(initialLocation)
        createPolylineTEST()
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

    func createPolylineTEST() {
        var point1 = CLLocationCoordinate2DMake(45.618082690786, -122.67548976989);
        var point2 = CLLocationCoordinate2DMake(45.615230134156, -122.67716015033);
        var point3 = CLLocationCoordinate2DMake(45.613067823185, -122.67844475556);
        var point4 = CLLocationCoordinate2DMake(45.613017670919, -122.67847455987);
        var point5 = CLLocationCoordinate2DMake(45.612975049029, -122.67849987978);
        
        var points: [CLLocationCoordinate2D]
        points = [point1, point2, point3, point4, point5]
        
        var geodesic = MKGeodesicPolyline(coordinates: &points[0], count: 5)
        
        self.mapView.addOverlay(geodesic)
        
        
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region1 = MKCoordinateRegion(center: point1, span: span)
            self.mapView.setRegion(region1, animated: true)
        })
        
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.whiteColor()
            polylineRenderer.lineWidth = 2
            return polylineRenderer
        } 
        return nil
    }

}

