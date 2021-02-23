//
//  DashboardChartCell.swift
//  SwiftSampleTest
//
//  Created by Lakeba-116 on 22/02/21.
//

import UIKit

class DashboardChartCell: UITableViewCell {
    @IBOutlet weak var pieChart : LambdaPieChart!
    @IBOutlet weak var lblTotalTask : UILabel!

    @IBOutlet weak var vwToDo : UIView!
    @IBOutlet weak var vwCompleted : UIView!
    @IBOutlet weak var vwPending : UIView!
//    @IBOutlet weak var vwCompleted : UIView!
//    @IBOutlet weak var vwCompleted : UIView!

    @IBOutlet weak var vwToDoBullet : UIView!
    @IBOutlet weak var vwCompletedBullet : UIView!
    @IBOutlet weak var vwPendingBullet : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.vwToDoBullet.layer.cornerRadius = self.vwToDoBullet.frame.size.width/2
        self.vwToDoBullet.clipsToBounds = true

        self.vwCompletedBullet.layer.cornerRadius = self.vwToDoBullet.frame.size.width/2
        self.vwCompletedBullet.clipsToBounds = true

        self.vwPendingBullet.layer.cornerRadius = self.vwToDoBullet.frame.size.width/2
        self.vwPendingBullet.clipsToBounds = true

        pieChart.lineWidth = 0.35
        pieChart.addChartData(data: [
            PieChartDataSet(percent: 20, colors: [UIColor.purpleishBlueThree,UIColor.purpleishBlueThree]),
            PieChartDataSet(percent: 80, colors: [UIColor.darkishPink,UIColor.darkishPink]),
        ])
        
        self.lblTotalTask.text = "6 \n Total Task"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
