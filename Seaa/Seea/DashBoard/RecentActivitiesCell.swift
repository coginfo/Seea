//
//  RecentActivitiesCell.swift
//  Seaa
//
//  Created by Lakeba-116 on 24/02/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class RecentActivitiesCell: UITableViewCell {
    @IBOutlet weak var vwTopDotted : UIView!
    @IBOutlet weak var vwBottomDotted : UIView!
//    @IBOutlet weak var vwTestDotted : UIView!

    @IBOutlet weak var lblDateAndTime : UILabel!

    @IBOutlet weak var vwActivitiesContent : UIView!
    @IBOutlet weak var lblActivityTitle : UILabel!
    @IBOutlet weak var lblPerson : UILabel!
    @IBOutlet weak var lblDescription : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        self.lblDateAndTime.text = "08 Feb\n07:15 AM"
        
        self.vwActivitiesContent.clipsToBounds = true
        self.vwActivitiesContent.layer.cornerRadius = 8
        
        self.lblActivityTitle.text = "Sastha please upload this month invoice"
        self.lblPerson.text = "Stella Raguram"
//        self.lblDescription.text = "Yes i verified all the finalcial document and uploaded. Can you please verify and submit it, Yes i verified all the finalcial document and uploaded. Can you please verify and submit it."

        self.lblDescription.text = "Yes i verified all the finalcial document and uploaded."

        self.vwTopDotted.createDottedLine(width: 2.0, color: UIColor.cyan.cgColor, height: self.vwActivitiesContent.frame.size.height + 10)
        self.vwBottomDotted.createDottedLine(width: 2.0, color: UIColor.cyan.cgColor, height: self.vwActivitiesContent.frame.size.height + 10)
//        self.vwTestDotted.createDottedLine(width: 2.0, color: UIColor.cyan.cgColor, height: self.vwActivitiesContent.frame.size.height + 10)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIView {
    func createDottedLine(width: CGFloat, color: CGColor, height: CGFloat) {
    let caShapeLayer = CAShapeLayer()
    caShapeLayer.strokeColor = color
    caShapeLayer.lineWidth = width
    caShapeLayer.lineDashPattern = [2,3]
    let cgPath = CGMutablePath()
    let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: height)]
//        let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: self.frame.height)]
//    let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: UIScreen.main.bounds.size.width)]
    cgPath.addLines(between: cgPoint)
    caShapeLayer.path = cgPath
    layer.addSublayer(caShapeLayer)
   }
}
