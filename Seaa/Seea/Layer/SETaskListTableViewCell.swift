//
//  SETaskListTableViewCell.swift
//  Seaa
//
//  Created by user on 5/12/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SETaskListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnEmployeeShort: UIButton!
    @IBOutlet weak var btnEmployeeSelection: UIButton!
    @IBOutlet weak var lblTaskName: UILabel!
    @IBOutlet weak var lblTaskOwnerName: UILabel!
    @IBOutlet weak var lblTask: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lblTaskName.font = UIFont.setAppFontSemiBold(14)
        self.lblTaskOwnerName.font = UIFont.setAppFontLight(14)
        self.lblTask.font = UIFont.setAppFontLight(14)
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
