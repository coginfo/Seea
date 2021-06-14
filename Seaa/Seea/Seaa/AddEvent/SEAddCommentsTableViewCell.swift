//
//  SEAddCommentsTableViewCell.swift
//  Seaa
//
//  Created by user on 5/13/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEAddCommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var txtComments: UITextView!
    override func awakeFromNib() {
        self.txtComments?.text = ""
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
