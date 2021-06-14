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
        self.txtAddEvent.layer.sublayerTransform = CATransform3DMakeTranslation(-5, 0, 0)
        self.selectionStyle = .none
    }


}
