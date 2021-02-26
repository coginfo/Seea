//
//  AddEventViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit
import SwiftyJSON


struct AddEventCellType {
    
    public var cellTitle: String?
    public var cellPlaceHolder: String?
    public var imageType: SEAddCellImageType?
    public var cellType: SEAddCellType?
    init(cellTitle: String?,cellPlaceHolder: String?, imageType: SEAddCellImageType?, cellType: SEAddCellType?) {
        self.cellTitle = cellTitle
        self.cellPlaceHolder = cellPlaceHolder
        self.imageType = imageType
        self.cellType = cellType
    }
}

struct AddEventSectionType {
    public var sectionTitle: String?
    public var imageType: SEAddCellImageType?
    public var sectionType: Int?
    init(sectionTitle: String?, sectionType: Int?) {
        self.sectionTitle = sectionTitle
        self.sectionType = sectionType
    }
}

class SEAddEventViewController: SEBaseViewController {

    var arrTitleData:[AddEventSectionType] = []
    var arrEventData:[AddEventCellType] = []
    
    @IBOutlet weak var tblAddEventList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblAddEventList?.delegate = self
        self.tblAddEventList?.dataSource = self
        self.tblAddEventList?.backgroundColor = UIColor.clear
        self.tblAddEventList.register(UINib(nibName: "SEAddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddEventTableViewCell")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.getAddTaskList()
    }

}

extension SEAddEventViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrTitleData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEventData.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.arrEventData[indexPath.row].cellType == .Normal{
            let cellValue:SEAddEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddEventTableViewCell", for: indexPath) as! SEAddEventTableViewCell
            cellValue.selectionStyle = .none
            return cellValue
        }else {
            let cellValue1:SETitleAddEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SETitleAddEventTableViewCell", for: indexPath) as! SETitleAddEventTableViewCell
            cellValue1.selectionStyle = .none
            return cellValue1
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.moveScrumMasterView(tagValue: indexPath.row)
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnBuyReadTapped(sender: UIButton) {
    }
    
    
    
}
extension SEAddEventViewController {
    
    func getAddTaskList()
    {
        if Reachability.isConnectedToNetwork() == true {
            
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Task Name", imageType: .TextOnly, cellType: .Normal))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Assigned date", imageType: .Calendar, cellType: .Normal))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Job Type", cellPlaceHolder: "", imageType: .DropDown, cellType: .Title))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Company", cellPlaceHolder: "", imageType: .DropDown, cellType: .Title))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Template", cellPlaceHolder: "", imageType: .DropDown, cellType: .Title))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Priority", cellPlaceHolder: "", imageType: .DropDown, cellType: .Title))

        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

extension SEAddEventViewController {
    
     @IBAction func btnMenuTapped() {
        let storyboard = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: SESlideMenuVC) as! SESlideMenuViewController
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: nil)
    }
}
