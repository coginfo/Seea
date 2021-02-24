//
//  TaskCollectionViewCell.swift
//  Seaa
//
//  Created by Lakeba-116 on 24/02/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {

    @IBOutlet var widthCollection: NSLayoutConstraint!
    @IBOutlet weak var vwCollectionCellBG : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.vwCollectionCellBG.clipsToBounds = true
        self.vwCollectionCellBG.layer.cornerRadius = 8
    }

}
