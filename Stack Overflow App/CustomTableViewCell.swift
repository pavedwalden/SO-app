//
//  CustomTableViewCell.swift
//  Stack Overflow App
//
//  Created by Alex on 7/31/14.
//  Copyright (c) 2014 Alex Rice. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var link = ""

    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
