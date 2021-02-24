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
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: nil)
    }
    
    override func btnSearchCustomisation_Click() {
        
        
    }
}
