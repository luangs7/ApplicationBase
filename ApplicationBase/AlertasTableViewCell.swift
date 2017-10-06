//
//  AlertasTableViewCell.swift
//  ApplicationBase
//
//  Created by Luan Silva on 06/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class AlertasTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var message: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
