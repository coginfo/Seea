//
//  SESlideMenuViewController.swift
//  Seaa
//
//  Created by user on 2/18/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SESlideMenuViewController: UIViewController {
    
    @IBOutlet weak var btnSlideMenu: UIButton!
    @IBOutlet weak var tblSlideMenu: UITableView!
    var menusArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menusArray.append("Profile")
        self.menusArray.append("Leave")
        self.menusArray.append("Leave List")
        self.tblSlideMenu.delegate = self
        self.tblSlideMenu.dataSource = self
        self.btnSlideMenu.addTarget(self, action:
            #selector(self.btnSlideMenuClick), for: .touchUpInside)
    }
    
    @objc func btnSlideMenuClick(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension SESlideMenuViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "CELL")
        }
        cell?.textLabel?.text = self.menusArray[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        self.tabBarController?.selectedIndex = 1
    }
}
