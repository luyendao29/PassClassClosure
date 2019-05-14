//
//  TableViewCell.swift
//  PassClosureTableView
//
//  Created by Boss on 5/12/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelage: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
