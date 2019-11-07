//
//  TableViewCell.swift
//  day05
//
//  Created by Ihor KOVALENKO on 10/7/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
