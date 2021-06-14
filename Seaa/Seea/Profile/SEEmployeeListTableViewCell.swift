//
//  SEEmployeeListTableViewCell.swift
//  Seaa
//
//  Created by user on 5/11/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEEmployeeListTableViewCell: UITableViewCell {

    @IBOutlet weak var btnEmployeeShort: UIButton!
    @IBOutlet weak var btnEmployeeSelection: UIButton!
    @IBOutlet weak var lblEmployeeName: UILabel!
    @IBOutlet weak var lblEmployeeNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lblEmployeeName.font = UIFont.setAppFontSemiBold(14)
        self.lblEmployeeNo.font = UIFont.setAppFontMedium(14)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
