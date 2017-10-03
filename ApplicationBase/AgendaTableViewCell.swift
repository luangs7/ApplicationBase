//
//  AgendaTableViewCell.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
