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
        //createPolylineTEST()
        drawAllHighways(PolyLineManager().getAllhighways())

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
        println(point1)
        points = [point1, point2, point3, point4, point5]
        println(points)
        
        var geodesic = MKGeodesicPolyline(coordinates: &points, count: 5)
        println(geodesic)
        
        self.mapView.addOverlay(geodesic)
        
//        UIView.animateWithDuration(1.5, animations: { () -> Void in
//            let span = MKCoordinateSpanMake(0.01, 0.01)
//            let region1 = MKCoordinateRegion(center: point1, span: span)
//            //self.mapView.setRegion(region1, animated: true)
//        })
        
    }
    
    func drawPolyLine(PolyLine: MKGeodesicPolyline){
        
        self.mapView.addOverlay(PolyLine)

    }
    
    func drawAllHighways(allHighways: [[[Int: Double]]]) -> MKGeodesicPolyline{
        //println(allHighways.count)
        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        var point: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0,0)
        for(var i = 0; i < allHighways.count; ++i){
            for(var j = 0; j < allHighways[j].count; ++j){
//                println(allHighways[0][0][0]!)
//                println("Adding point:")
                print(allHighways[i][j][0]!)
                print(" ")
                println(allHighways[i][j][1]!)
                point = CLLocationCoordinate2DMake(allHighways[i][j][0]!, allHighways[i][j][1]!);
                points.append(point)
            }
        }
        //println(points)
        
        println("---------------------")
        println(points)
        var PolyLine = MKGeodesicPolyline(coordinates: &points, count: points.count)
        println(PolyLine)
        PolyLine.title = "Highways"
        self.mapView.addOverlay(PolyLine)
        
        return PolyLine
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.redColor()
            polylineRenderer.lineWidth = 10
            return polylineRenderer
        } 
        return nil
    }

}

