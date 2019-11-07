//
//  ViewController.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/2/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var deathTable: UITableView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        self.navigationItem.hidesBackButton = true;
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.names.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LabelsViewController
        cell.name = Data.names[indexPath.row]
        cell.nameLabel?.numberOfLines = 0
        cell.descriptionLabel?.numberOfLines = 0
        cell.dateLabel?.numberOfLines = 0
        deathTable.rowHeight = UITableViewAutomaticDimension
        deathTable.estimatedRowHeight = 44
        
        return cell;
    }
}

