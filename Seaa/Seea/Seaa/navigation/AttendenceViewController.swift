//
//  AttendenceViewController.swift
//  Seaa
//
//  Created by user on 6/14/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class AttendenceViewController: UIViewController {

    @IBOutlet var tblInnerTask: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnBack.addTarget(self, action: #selector(self.btnBackTapped), for: .touchUpInside)
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
