//
//  SESlideMenuViewController.swift
//  Seaa
//
//  Created by user on 2/18/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit


struct ProfileArray {
    public var sectionTitle: String?
    public var imageType: String?
    init(sectionTitle: String?, imageType: String?) {
        self.sectionTitle = sectionTitle
        self.imageType = imageType
    }
}

protocol MenuSelectionInfoVCDelegate: class {
    func selectedMenu(menu: Int)
}

class SESlideMenuViewController: UIViewController {
    
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var profileImgView: ProfileImageView!
    @IBOutlet weak var btnSlideMenu: UIButton!
    @IBOutlet weak var tblSlideMenu: UITableView!
    var menusArray:[ProfileArray] = []
    var delegate:MenuSelectionInfoVCDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menusArray.append(ProfileArray.init(sectionTitle: "Home", imageType: "home_1"))
        self.menusArray.append(ProfileArray.init(sectionTitle: "Activities", imageType: "layer"))
        self.menusArray.append(ProfileArray.init(sectionTitle: "Attendance", imageType: "calender_1x"))
        self.menusArray.append(ProfileArray.init(sectionTitle: "Level Required", imageType: "calender_1x"))
        self.menusArray.append(ProfileArray.init(sectionTitle: "Logout", imageType: "arrow_1x"))
        self.tblSlideMenu.delegate = self
        self.tblSlideMenu.dataSource = self
        self.btnSlideMenu.addTarget(self, action:
            #selector(self.btnSlideMenuClick), for: .touchUpInside)
        self.lblProfileName.font = UIFont.setAppFontSemiBold(12)
        self.lblProfileName.textColor = UIColor.white
        self.tblSlideMenu.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableViewCell")

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
        
        let cellValue:SideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
        cellValue.btnImage.setImage(UIImage.init(named: self.menusArray[indexPath.row].imageType ?? ""), for: .normal)
        cellValue.btnImage.backgroundColor = UIColor.clear
        cellValue.lblTitle?.text = self.menusArray[indexPath.row].sectionTitle ?? ""
        return cellValue
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.selectedMenu(menu: indexPath.row)
    }
}
