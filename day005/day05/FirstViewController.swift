//
//  FirstViewController.swift
//  day05
//
//  Created by Ihor KOVALENKO on 10/7/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var Data : [String] = ["Kiev",
                           "Odessa",
                           "Stockholm",
                           ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cityLabel.text = Data[indexPath.row];
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapTab = self.tabBarController?.viewControllers![0] as! SecondViewController
        switch indexPath {
        case [0, 0]:
            mapTab.mapView.zoomToLocation(location: mapTab.kiev.coordinate)
        case [0, 1]:
            mapTab.mapView.zoomToLocation(location: mapTab.odessa.coordinate)
        case [0, 2]:
            mapTab.mapView.zoomToLocation(location: mapTab.stockholm.coordinate)
        default :
            mapTab.mapView.zoomToLocation(location: mapTab.unit.coordinate)
        }
        self.tabBarController?.selectedIndex = 0
    }


}

