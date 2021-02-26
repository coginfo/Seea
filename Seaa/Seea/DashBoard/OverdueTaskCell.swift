//
//  OverdueTaskCell.swift
//  Seaa
//
//  Created by Lakeba-116 on 24/02/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class OverdueTaskCell: UITableViewCell {
    @IBOutlet var overdueCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
