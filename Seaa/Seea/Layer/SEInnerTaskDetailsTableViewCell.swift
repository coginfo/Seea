//
//  SEInnerTaskDetailsTableViewCell.swift
//  Seaa
//
//  Created by user on 5/12/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEInnerTaskDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var vwTopDotted : UIView!
    @IBOutlet weak var vwBottomDotted : UIView!
//    @IBOutlet weak var vwTestDotted : UIView!

    @IBOutlet weak var lblDateAndTime : UILabel!

    @IBOutlet weak var vwActivitiesContent : UIView!
    @IBOutlet weak var lblActivityTitle : UILabel!
    @IBOutlet weak var btnFile : UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        self.lblDateAndTime.text = "08 Feb\n07:15 AM"
        
        self.vwActivitiesContent.clipsToBounds = true
        self.vwActivitiesContent.layer.cornerRadius = 8
        
        self.lblActivityTitle.text = "Sastha please upload this month invoice"
//        self.lblDescription.text = "Yes i verified all the finalcial document and uploaded. Can you please verify and submit it, Yes i verified all the finalcial document and uploaded. Can you please verify and submit it."


        self.vwTopDotted.createDottedLine(width: 2.0, color: UIColor.cyan.cgColor, height: self.vwActivitiesContent.frame.size.height + 10)
        self.vwBottomDotted.createDottedLine(width: 2.0, color: UIColor.cyan.cgColor, height: self.vwActivitiesContent.frame.size.height + 10)
//        self.vwTestDotted.createDottedLine(width: 2.0, color: UIColor.cyan.cgColor, height: self.vwActivitiesContent.frame.size.height + 10)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

