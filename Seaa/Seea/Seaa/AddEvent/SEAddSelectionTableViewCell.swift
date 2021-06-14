//
//  SEAddSelectionTableViewCell.swift
//  Seaa
//
//  Created by user on 5/11/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEAddSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnSelection: UIButton!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var viewSelection: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.lblText.numberOfLines = 0
        self.lblText.font = UIFont.setAppFontSemiBold(14)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
