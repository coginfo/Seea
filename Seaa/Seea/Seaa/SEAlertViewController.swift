//
//  SEAlertViewController.swift
//  Seaa
//
//  Created by user on 2/18/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEAlertViewController: UIViewController {
    
    @IBOutlet weak var btnAlertStatusImg: UIImageView!
    @IBOutlet weak var btnAlertClose: UIButton!
    @IBOutlet weak var lblAlertMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnAlertClose.addTarget(self, action: #selector(self.btnAlertCloseTapped), for: .touchUpInside)
        self.btnAlertClose.setImage(UIImage.init(named: CLOSED_ALERT), for: .normal)
    }
    
}
extension SEAlertViewController {
    
    @objc func btnAlertCloseTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setAlertMessage(message:String, imageType:SEAlertMessageType)   {
        self.lblAlertMessage?.text = message
        switch imageType {
        case .Completed:
            self.btnAlertStatusImg?.image = UIImage.init(named: COMPLETED_ALERT)
        case .InProgress:
            self.btnAlertStatusImg?.image = UIImage.init(named: COMPLETED_ALERT)
        case .NotCompleted:
            self.btnAlertStatusImg?.image = UIImage.init(named: COMPLETED_ALERT)
        }
        self.btnAlertStatusImg?.tintColor = UIColor.appThemeColor()
    }
}
