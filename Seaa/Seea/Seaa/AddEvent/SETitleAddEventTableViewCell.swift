//
//  SETitleAddEventTableViewCell.swift
//  Seaa
//
//  Created by user on 2/24/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SETitleAddEventTableViewCell: UITableViewCell {

    @IBOutlet weak var txtTitleAddEvent: TxtAddEvent!
    @IBOutlet weak var addTitleEventImageview: UIImageView!
    @IBOutlet weak var lblTitleAddEvent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
