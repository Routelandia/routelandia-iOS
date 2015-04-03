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
        DrawAllHighways(PolyLineManager().getAllhighways())
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
        var point2 = CLLocationCoordinate2DMake(45.608105591041, -122.68130608198);
        var point3 = CLLocationCoordinate2DMake(45.598834851874, -122.68439119221);
        var point4 = CLLocationCoordinate2DMake(45.589224815901, -122.68159684059);
        var point5 = CLLocationCoordinate2DMake(45.584487783086, -122.67948963368);
        
        var points: [CLLocationCoordinate2D]
        points = [point1, point2, point3, point4, point5]
        
        var geodesic = MKGeodesicPolyline(coordinates: &points, count: 5)
        
        self.mapView.addOverlay(geodesic)
        
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region1 = MKCoordinateRegion(center: point1, span: span)
            //self.mapView.setRegion(region1, animated: true)
        })
        
    }
    
    func DrawAllHighways(allHighways: [[[Int: Double]]]){
        var i = 0
        var j = 0
        //println(allHighways.count)
        for(i = 0; i < allHighways.count; ++i){
            for(j = 0; j < 10; ++j){
                //println(allHighways[0][0][0]!)
                let lat = allHighways[j]
                println(lat)
                
            }
        }
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.redColor()
            polylineRenderer.lineWidth = 2
            return polylineRenderer
        } 
        return nil
    }

}

