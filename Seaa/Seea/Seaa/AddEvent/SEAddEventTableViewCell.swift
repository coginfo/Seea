//
//  SEAddEventTableViewCell.swift
//  Seaa
//
//  Created by user on 2/24/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEAddEventTableViewCell: UITableViewCell {

    @IBOutlet weak var txtAddEvent: TxtAddEvent!
    @IBOutlet weak var addEventImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.txtAddEvent.layer.sublayerTransform = CATransform3DMakeTranslation(-5, 0, 0)
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
