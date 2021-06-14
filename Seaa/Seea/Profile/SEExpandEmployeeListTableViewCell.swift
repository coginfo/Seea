//
//  SEExpandEmployeeListTableViewCell.swift
//  Seaa
//
//  Created by user on 5/11/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEExpandEmployeeListTableViewCell: UITableViewCell {

    @IBOutlet weak var btnEmployeeShort: UIButton!
    @IBOutlet weak var btnEmployeeSelection: UIButton!
    @IBOutlet weak var lblEmployeeName: UILabel!
    @IBOutlet weak var lblEmployeeNo: UILabel!
    
    @IBOutlet weak var lblTodayTask: UILabel!
    @IBOutlet weak var lblPendingTask: UILabel!
    @IBOutlet weak var lblCompleteTask: UILabel!
    
    @IBOutlet weak var lblTodayTaskTitle: UILabel!
    @IBOutlet weak var lblPendingTaskTitle: UILabel!
    @IBOutlet weak var lblCompleteTaskTitle: UILabel!
    
    @IBOutlet weak var btnViewDetails: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lblEmployeeName.font = UIFont.setAppFontSemiBold(14)
        self.lblEmployeeNo.font = UIFont.setAppFontMedium(14)
        self.lblTodayTaskTitle.text = "TODAY TASK"
        self.lblPendingTaskTitle.text = "PENDING TASK"
        self.lblCompleteTaskTitle.text = "COMPLETE TASK"
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
