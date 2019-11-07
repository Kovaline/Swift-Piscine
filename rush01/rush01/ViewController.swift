//
//  ViewController.swift
//  rush01
//
//  Created by Ihor KOVALENKO on 10/13/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class ViewController: UIViewController {

    @IBAction func userLoc(_ sender: Any) {
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
    }
    @IBAction func buildAutoRoute(_ sender: Any) {
        if (selectedPin == nil || locationManager.location == nil) {
            return
        }
        let direction = MKDirections.Request()
        let currentLocation = locationManager.location
        let source = CLLocationCoordinate2D(latitude: currentLocation!.coordinate.latitude, longitude: currentLocation!.coordinate.longitude)
        let sourcePlacemark = MKPlacemark(coordinate: source, addressDictionary: nil)
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let dest = CLLocationCoordinate2D(latitude: selectedPin!.coordinate.latitude, longitude: selectedPin!.coordinate.longitude)
        let destPlacemark = MKPlacemark(coordinate: dest, addressDictionary: nil)
        let destMapItem = MKMapItem(placemark: destPlacemark)
        direction.source = sourceMapItem;
        direction.destination = destMapItem;
        direction.transportType = .automobile;
        let directions  = MKDirections(request: direction)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            self.mapView.removeOverlays(self.mapView.overlays)
            let route = response.routes[0]
            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    @IBAction func buildRoute(_ sender: Any) {
        
        if (selectedPin == nil || locationManager.location == nil) {
            return
        }
        let direction = MKDirections.Request()
        let currentLocation = locationManager.location
        let source = CLLocationCoordinate2D(latitude: currentLocation!.coordinate.latitude, longitude: currentLocation!.coordinate.longitude)
        let sourcePlacemark = MKPlacemark(coordinate: source, addressDictionary: nil)
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let dest = CLLocationCoordinate2D(latitude: selectedPin!.coordinate.latitude, longitude: selectedPin!.coordinate.longitude)
        let destPlacemark = MKPlacemark(coordinate: dest, addressDictionary: nil)
        let destMapItem = MKMapItem(placemark: destPlacemark)
        direction.source = sourceMapItem;
        direction.destination = destMapItem;
        direction.transportType = .walking;
        let directions  = MKDirections(request: direction)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            self.mapView.removeOverlays(self.mapView.overlays)
            let route = response.routes[0]
            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    @IBOutlet weak var toolBar: UIToolbar!
    var selectedPin:MKPlacemark? = nil;
    let locationManager = CLLocationManager()
    var searchController: UISearchController? = nil;
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let search = storyboard!.instantiateViewController(withIdentifier: "Search") as! Search
        searchController = UISearchController(searchResultsController: search)
        searchController?.searchResultsUpdater = search
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization();
        locationManager.requestLocation();
        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = searchController?.searchBar
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.dimsBackgroundDuringPresentation = true;
        definesPresentationContext = true
        search.mapView = mapView
        search.handleMapSearchDelegate = self;
        
        // Do any additional setup after loading the view.
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 2.0
        
        return renderer
    }
}


extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: (error)")
    }
    
}

extension ViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        selectedPin = placemark
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}

extension ViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        pinView?.pinTintColor = UIColor.orange;
        pinView?.canShowCallout = true
        return pinView
    }
}

