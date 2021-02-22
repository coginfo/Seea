//
//  SEFolderViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEFolderViewController: SEBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
}
extension SEFolderViewController {
    
    @IBAction func btnLogOutTapped(_ sender: Any) {
        let viewController = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil).instantiateViewController(withIdentifier: "SENavigationViewController") as! SENavigationViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
