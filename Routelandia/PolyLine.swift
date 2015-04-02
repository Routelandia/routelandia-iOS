//
//  PolyLine.swift
//  Routelandia
//
//  Created by Peter Gicking on 4/1/15.
//  Copyright (c) 2015 Portland State University. All rights reserved.
//

import Foundation
import UIKit
import MapKit

func createPolylineTEST(mapView: MKMapView) {
    var point1 = CLLocationCoordinate2DMake(-122.67548976989, 45.618082690786);
    var point2 = CLLocationCoordinate2DMake(-122.67716015033, 45.615230134156);
    var point3 = CLLocationCoordinate2DMake(-122.67844475556, 45.613067823185);
    var point4 = CLLocationCoordinate2DMake(-122.67847455987, 45.613017670919);
    var point5 = CLLocationCoordinate2DMake(-122.67849987978, 45.612975049029);
    
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