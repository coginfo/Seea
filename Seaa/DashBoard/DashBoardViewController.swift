//
//  DashBoardViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class DashBoardViewController: SEBaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
}
extension DashBoardViewController: NavButtonActionDelegate {
    
    func backButtonPressed(_ sender: UIButton) {
        
    }
    
    func searchButtonPressed(_ sender: UIButton) {
        
    }
    
    func menuButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func clickActionDash(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "DasBoardDetailsViewController") as! DasBoardDetailsViewController
        self.navigationController?.pushViewController(initial, animated: true)
    }
    
    @IBAction func clickAlertViewTapped(_ sender: Any) {
        self.showSEAlertViewController()
    }
    
    
    func showSEAlertViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEAlertViewController") as! SEAlertViewController
        initial.setAlertMessage(message: "Task Completed", imageType: .Completed)
        self.navigationController?.pushViewController(initial, animated: true)
    }
}
