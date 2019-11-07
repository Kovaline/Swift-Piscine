//
//  TableViewCell.swift
//  day09
//
//  Created by Ihor KOVALENKO on 10/11/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var photo : UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var creation_date : UILabel!
    @IBOutlet weak var mod_date : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
