//
//  SEChildBaseViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit



class SEChildBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor.appViewBackColor()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let tabVC = self.tabBarController as? SETabbarViewController {
            tabVC.addActionButton?.isHidden = true
        }
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        if let tabVC = self.tabBarController as? SETabbarViewController {
            tabVC.addActionButton?.isHidden = false
        }
    }
    
    func setNavigationButton(navigationButtonType:NavigationButtonType)  {
        self.navigationController?.navigationBar.tintColor = UIColor.appThemeColor()
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        switch navigationButtonType {
        case .WithButtons:
            let rightBarButtonItem1 = UIBarButtonItem(image: UIImage(named: SIDE_MENU_NAV)?.withRenderingMode(.automatic), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnMenuCustomisation_Click))
            rightBarButtonItem1.tintColor = UIColor.appThemeColor()
            let rightBarButtonItem2 = UIBarButtonItem(image: UIImage(named: SEARCH_GLASS_NAV)?.withRenderingMode(.alwaysTemplate), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnSearchCustomisation_Click))
            rightBarButtonItem2.tintColor = UIColor.appThemeColor()
            self.navigationItem.setRightBarButtonItems([rightBarButtonItem1,rightBarButtonItem2], animated: true)
            break
        case .WithBackButton:
            let rightBarButtonItem2 = UIBarButtonItem(image: UIImage(named: SEARCH_GLASS_NAV)?.withRenderingMode(.alwaysTemplate), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnSearchCustomisation_Click))
            rightBarButtonItem2.tintColor = UIColor.appThemeColor()
            self.navigationItem.setRightBarButton(rightBarButtonItem2, animated: true)
            break
        case .WithOutBackButton:
            let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
            navigationItem.leftBarButtonItem = backButton
            let rightBarButtonItem1 = UIBarButtonItem(image: UIImage(named: SIDE_MENU_NAV)?.withRenderingMode(.automatic), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnMenuCustomisation_Click))
            rightBarButtonItem1.tintColor = UIColor.appThemeColor()
            let rightBarButtonItem2 = UIBarButtonItem(image: UIImage(named: SEARCH_GLASS_NAV)?.withRenderingMode(.alwaysTemplate), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnSearchCustomisation_Click))
            rightBarButtonItem2.tintColor = UIColor.appThemeColor()
            self.navigationItem.setRightBarButtonItems([rightBarButtonItem1,rightBarButtonItem2], animated: true)
            break
        case .WithOutSearchButton:
            let rightBarButtonItem1 = UIBarButtonItem(image: UIImage(named: SIDE_MENU_NAV)?.withRenderingMode(.automatic), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.btnMenuCustomisation_Click))
            rightBarButtonItem1.tintColor = UIColor.appThemeColor()
            self.navigationItem.setRightBarButton(rightBarButtonItem1, animated: true)
            break
        }
        
        
    }
    
    @objc func btnMenuCustomisation_Click() {
        
    }
    
    @objc func btnSearchCustomisation_Click() {
        
    }
}
