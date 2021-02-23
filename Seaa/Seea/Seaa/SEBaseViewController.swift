//
//  SEBaseViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor.appViewBackColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
   
}
