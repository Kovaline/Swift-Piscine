//
//  LabelsViewController.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/2/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class LabelsViewController: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var name : (String, String, String)? {
        didSet {
            if let n = name {
                nameLabel?.text = n.0
                descriptionLabel?.text = n.1
                dateLabel?.text = n.2
            }
        }
    }
    
}
