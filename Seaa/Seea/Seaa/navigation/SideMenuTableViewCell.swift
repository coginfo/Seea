//
//  SideMenuTableViewCell.swift
//  Seaa
//
//  Created by user on 6/14/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnImage: BtnEmployeeShort!
    @IBOutlet weak var lblTitle: APPHeadingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
