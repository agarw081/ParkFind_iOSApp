//
//  ViewController.swift
//  ParkFind
//
//  Created by Umang Agarwal on 9/20/15.
//  Copyright © 2015 Umang Agarwal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    let annotation = MKPointAnnotation()
    
    var coreLocationManager = CLLocationManager()
    
    
    //MapView
    @IBOutlet weak var mapView: MKMapView!
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup our Location Manager
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        //Setup our Map View
        mapView.showsUserLocation = true
        
        
    }
    
    //Setting zoom and location of map based on user location
   func locationManager(manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
    
        let spanX = 0.015
        let spanY = 0.015
    
        var newRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
    
        mapView.setRegion(newRegion, animated: true)
   }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Function that defines function of the "Mark my button" button in GUI
    @IBAction func updateLocation(sender: AnyObject) {
        let lat = self.mapView.userLocation.coordinate.latitude
        let long = self.mapView.userLocation.coordinate.longitude
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            annotation.title = "MyCar";
            annotation.subtitle = "";
        self.mapView.addAnnotation(annotation)
        }
    
    //Function that defines function of the "Show my car" button in GUI
    @IBAction func viewCarlocation(sender: AnyObject) {
        self.mapView.selectAnnotation(annotation, animated: true)
    }
    
    //Function that defines function of the "Clear map" button in GUI
    @IBAction func deleteCarlocation(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
    }
    

}

