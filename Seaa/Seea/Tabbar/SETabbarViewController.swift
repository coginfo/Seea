//
//  SETabbarViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SETabbarViewController: UITabBarController {
    
    var addActionButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nav1 = UINavigationController(rootViewController: self.getTabbarViewController(viewName: DashBoardVC, imageName: HOME_TAB, viewTag: 0))
        let nav2 = UINavigationController(rootViewController: self.getTabbarViewController(viewName: SELayerVC, imageName: LAYER_TAB, viewTag: 1))
        let nav3 = UINavigationController(rootViewController: self.getTabbarViewController(viewName: SEAddEventVC, imageName: "", viewTag: 2))
        let nav4 = UINavigationController(rootViewController: self.getTabbarViewController(viewName: SEProfileVC, imageName: PROFILE_TAB, viewTag: 3))
        let nav5 = UINavigationController(rootViewController: self.getTabbarViewController(viewName: SEFolderVC, imageName: FOLDER_TAB, viewTag: 4))
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
        self.setupMiddleButton()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        self.tabBarController?.tabBar.delegate = self
    }
    
    func getTabbarViewController(viewName:String,imageName:String,viewTag:Int) -> UIViewController {
        let story = UIStoryboard.init(name: MAIN_STORY_BOARD, bundle: Bundle.main);
        let fvc = story.instantiateViewController(withIdentifier: viewName)
        fvc.tabBarItem = UITabBarItem(title: "", image: UIImage.init(named: imageName), tag: viewTag)
        return fvc
    }
    
    func setupMiddleButton() {
        self.addActionButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var menuButtonFrame = addActionButton!.frame
        if UIDevice.current.hasNotch {
            self.addActionButton?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
            menuButtonFrame.origin.y = view.bounds.height - (addActionButton?.frame.height ?? 0.0) - 32
        }else {
            self.addActionButton?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
            menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
            menuButtonFrame.origin.y = view.bounds.height - (addActionButton?.frame.height ?? 0.0) - 16
        }
        addActionButton?.setTitleColor(UIColor.white, for: .normal)
        addActionButton?.frame = menuButtonFrame
        addActionButton?.backgroundColor = UIColor.appThemeColor()
        addActionButton?.layer.cornerRadius = 10.0
        view.addSubview(addActionButton!)
        addActionButton?.setImage(UIImage(named: ADD_ICON_TAB), for: .normal)
        addActionButton?.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        view.layoutIfNeeded()
    }

    // MARK: - Actions
    
    @objc private func menuButtonAction(sender: UIButton) {
        selectedIndex = 2
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
