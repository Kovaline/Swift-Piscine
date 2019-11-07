//
//  Search.swift
//  rush01
//
//  Created by Ihor KOVALENKO on 10/13/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit
import MapKit

class Search : UITableViewController {
    var matchingItems: [MKMapItem] = [];
    var mapView : MKMapView? = nil;
    var handleMapSearchDelegate:HandleMapSearch? = nil
    
    func getAddress(item: MKPlacemark) -> String {
        let firstSpace = (item.subThoroughfare != nil && item.thoroughfare != nil) ? " " : ""
        let comma = (item.subThoroughfare != nil || item.thoroughfare != nil) && (item.subAdministrativeArea != nil || item.administrativeArea != nil) ? ", " : ""
        let secondSpace = (item.subAdministrativeArea != nil && item.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            item.subThoroughfare ?? "",
            firstSpace,
            item.thoroughfare ?? "",
            comma,
            item.locality ?? "",
            secondSpace,
            item.administrativeArea ?? ""
        )
        return addressLine
    }
}

extension Search :UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            self.tableView.reloadData()
        }
    }
}

extension Search {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let item = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = getAddress(item: item)
        
        return cell;
    }
}

extension Search {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: item)
        dismiss(animated: true, completion: nil)
    }
}
