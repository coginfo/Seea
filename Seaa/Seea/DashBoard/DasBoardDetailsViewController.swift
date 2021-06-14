//
//  DasBoardDetailsViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class DasBoardDetailsViewController: SEChildBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationButton(navigationButtonType: .WithButtons)
    }
    
    override func btnMenuCustomisation_Click() {
        let storyboard = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: SESlideMenuVC) as! SESlideMenuViewController
        initial.delegate = self
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: nil)
    }
    
    override func btnSearchCustomisation_Click() {
        
        
    }
}

extension DasBoardDetailsViewController: MenuSelectionInfoVCDelegate {
    
    func selectedMenu(menu: Int) {
        switch menu {
        case 0:
            self.tabBarController?.selectedIndex = 0
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initial = storyboard.instantiateViewController(withIdentifier: "RecentActivityViewController") as! RecentActivityViewController
            self.navigationController?.pushViewController(initial, animated: true)
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initial = storyboard.instantiateViewController(withIdentifier: "AttendenceViewController") as! AttendenceViewController
            self.navigationController?.pushViewController(initial, animated: true)
        case 3:
            self.tabBarController?.selectedIndex = 1
        case 4:
            let viewController = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil).instantiateViewController(withIdentifier: "SENavigationViewController") as! SENavigationViewController
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        default:
            break
        }
    }
    
    
     
}
