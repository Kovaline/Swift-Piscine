//
//  SecondViewController.swift
//  day05
//
//  Created by Ihor KOVALENKO on 10/7/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MyPointAnnotation : MKPointAnnotation {
    var pinTintColor: UIColor?
}

class SecondViewController: UIViewController, MKMapViewDelegate {


    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func userLocation(_ sender: Any) {
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
    }
    
    @IBAction func segControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
    let kiev = MyPointAnnotation()
    let odessa = MyPointAnnotation()
    let stockholm = MyPointAnnotation()
    let unit = MKPointAnnotation()
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true;
        mapView.delegate = self;
        unit.coordinate = CLLocationCoordinate2D(latitude: 50.469018, longitude: 30.462286)
        kiev.coordinate = CLLocationCoordinate2D(latitude: 50.450100, longitude: 30.523399)
        kiev.pinTintColor = .purple;
        stockholm.coordinate = CLLocationCoordinate2D(latitude: 59.329323, longitude: 18.068581)
        stockholm.pinTintColor = .green
        odessa.coordinate = CLLocationCoordinate2D(latitude: 46.482525, longitude: 30.723309)
        odessa.pinTintColor = .black
        mapView.addAnnotations([unit, stockholm, kiev, odessa])
        self.mapView.zoomToLocation(location: unit.coordinate)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        unit.title = "UNIT Factory"
        unit.subtitle = "Coordinates: 50.469018, 30.462286"
        odessa.title = "Odessa"
        odessa.subtitle = "Its a city"
        kiev.title = "Kiev"
        kiev.subtitle = "Its a capital of Ukraine"
        stockholm.subtitle = "Its a capital of Sweden"
        stockholm.title = "Stockholm"
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
        } else {
            annotationView?.annotation = annotation
        }
        
        if let annotation = annotation as? MyPointAnnotation {
            annotationView?.pinTintColor = annotation.pinTintColor
        }
        
        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension MKMapView {
    func zoomToLocation(location : CLLocationCoordinate2D,latitudinalMeters:CLLocationDistance = 100,longitudinalMeters:CLLocationDistance = 100)
    {
        let region = MKCoordinateRegionMakeWithDistance(location, latitudinalMeters, longitudinalMeters)
        setRegion(region, animated: true)
    }
    
}
