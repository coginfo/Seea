//
//  SELayerViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit
import DatePicker

struct TaskList {
    public var taskName: String?
    public var taskOwner: String?
    public var task: String?
    init(taskName: String?,taskOwner: String?, task: String?) {
        self.taskName = taskName
        self.taskOwner = taskOwner
        self.task = task
    }
}

class SELayerViewController: SEBaseViewController {
    
    var arrEmployeeData:[TaskList] = []
    @IBOutlet weak var tblTaskList: UITableView!
    @IBOutlet weak var btnDate1: UIButton!
    @IBOutlet weak var btnDate2: UIButton!
    @IBOutlet weak var btnFilter: PickerButton!
    
    var companyBaseList:CompanyBaseList? = nil
    var firmAllTask: SEFirmAllTask? = nil
    
    var selectedtask_to:String = ""
    var selectedtask_from:String = ""
    
    var selectedEmployeeID:String = ""
    var selectedCompanyID:String = ""
    var selectedTasKStatus:String = ""
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblTaskList?.delegate = self
        self.tblTaskList?.dataSource = self
        self.tblTaskList?.backgroundColor = UIColor.clear
        self.tblTaskList?.register(UINib(nibName: "SETaskListTableViewCell", bundle: nil), forCellReuseIdentifier: "SETaskListTableViewCell")
        self.tblTaskList?.rowHeight = UITableView.automaticDimension
        self.tblTaskList?.estimatedRowHeight = 300
        self.tblTaskList?.separatorColor = UIColor.clear
        self.btnDate1?.addTarget(self, action: #selector(self.btnDate1Tapped), for: .touchUpInside)
        self.btnDate2?.addTarget(self, action: #selector(self.btnDate2Tapped), for: .touchUpInside)
        self.btnFilter?.addTarget(self, action: #selector(self.btnFilterTapped), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //self.getAddTaskList()
        self.getAllTaskList()
        self.btnDate1.setTitleColor(UIColor.lightGray, for: .normal)
        self.btnDate2.setTitleColor(UIColor.lightGray, for: .normal)
    }
    
    @objc func btnFilterTapped(sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEFilterViewController") as! SEFilterViewController
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion:nil)
        
    }
    
    
    
    

}

extension SELayerViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firmAllTask?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue:SETaskListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SETaskListTableViewCell", for: indexPath) as! SETaskListTableViewCell
        cellValue.btnEmployeeShort.setTitle(String(format: "%d", indexPath.row + 1), for: .normal)
        cellValue.lblTaskName.text = String(format: "%@", self.firmAllTask?.result?[indexPath.row].task_title ?? "")
        cellValue.lblTaskOwnerName.text = String(format: "%@", self.firmAllTask?.result?[indexPath.row].emp_name ?? "")
        if self.firmAllTask?.result?[indexPath.row].status == "0" {
            cellValue.lblTask.text = "• Completed"
            cellValue.lblTask.textColor = UIColor.init(hex: "#f5805a")
        }else if self.firmAllTask?.result?[indexPath.row].status == "1" {
            cellValue.lblTask.text = "• Ongoing"
            cellValue.lblTask.textColor = UIColor.init(hex: "#ffbf3b")
        }else {
            cellValue.lblTask.text = "• Pending"
            cellValue.lblTask.textColor = UIColor.init(hex: "#4f3ec8")
        }
        
        cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
        cellValue.btnEmployeeSelection.tag = indexPath.row
        cellValue.btnEmployeeSelection.addTarget(self, action: #selector(self.btnEmployeeSelectionExpandDetails), for: .touchUpInside)
        return cellValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SETaskDetailsViewController") as! SETaskDetailsViewController
        initial.selectedFirmTaskID = self.firmAllTask?.result?[indexPath.row].task_id
        self.navigationController?.pushViewController(initial, animated: true)
        
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnBuyReadTapped(sender: UIButton) {
    }
    
    
    
    
}
extension SELayerViewController {
    
    func getAddTaskList()
    {
        if Reachability.isConnectedToNetwork() == true || Reachability.isConnectedToNetwork() == false {
            self.arrEmployeeData.removeAll()
            self.arrEmployeeData.append(TaskList.init(taskName: "Auditing", taskOwner: "Vinoth", task: "Completed"))
            self.arrEmployeeData.append(TaskList.init(taskName: "Internal Audition for second Quarter", taskOwner: "Anish", task: "Completed"))
            self.arrEmployeeData.append(TaskList.init(taskName: "File IT Retun", taskOwner: "Not Assign", task: "Ongoing"))
            self.arrEmployeeData.append(TaskList.init(taskName: "File IT Retun", taskOwner: "Vinoth", task: "Ongoing"))
            self.arrEmployeeData.append(TaskList.init(taskName: "File IT Retun", taskOwner: "Not Assign", task: "Pending"))
            self.arrEmployeeData.append(TaskList.init(taskName: "File IT Retun", taskOwner: "Vinoth", task: "Pending"))
            
            self.tblTaskList?.reloadData()
        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

extension SELayerViewController: MenuSelectionInfoVCDelegate {
    
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
    
    @IBAction func btnMenuTapped() {
        let storyboard = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: SESlideMenuVC) as! SESlideMenuViewController
        initial.delegate = self
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: nil)
    }
}

extension SELayerViewController {
    
    @objc func btnEmployeeSelectionExpandDetails(sender: UIButton) {
        self.tblTaskList.reloadData()
    }
    
    @objc func btnEmployeeSelectionBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnDate1Tapped(sender: UIButton) {
        self.btnDate1.tag = 1001
        self.showDateValue(btnDate: self.btnDate1)
    }
    @objc func btnDate2Tapped(sender: UIButton) {
        self.btnDate2.tag = 1002
        self.showDateValue(btnDate: self.btnDate2)
    }
    
    func showDateValue(btnDate:UIButton)  {
        let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
        let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
        let today = Date()
        // Create picker object
        let datePicker = DatePicker()
        // Setup
        datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
            if selected, let selectedDate = date {
                if btnDate.tag == 1001 {
                    self.btnDate1.setTitle(String(format: "%@", selectedDate.stringTo()), for: .normal)
                    self.btnDate1.setTitleColor(UIColor.black, for: .normal)
                }else {
                    self.btnDate2.setTitle(String(format: "%@", selectedDate.stringTo()), for: .normal)
                    self.btnDate2.setTitleColor(UIColor.black, for: .normal)
                }
            } else {
                print("Cancelled")
            }
        }
        datePicker.show(in: self, on: btnDate)
    }
}
extension SELayerViewController {
    
    func getAllTaskList()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,"task_from" : self.selectedtask_from as AnyObject,
            "task_to" : self.selectedtask_to as AnyObject,
            "task_emp" : self.selectedEmployeeID as AnyObject,
            "task_com" : self.selectedCompanyID as AnyObject,
            "task_status" : self.selectedTasKStatus as AnyObject]
            print(dictParams)
            HttpManager.sharedInstance.getAllTaskListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.firmAllTask = nil
                        self.firmAllTask = try jsonDecoder.decode(SEFirmAllTask.self, from: responseObject as! Data)
                        if self.firmAllTask?.key == "1301" {
                            self.tblTaskList?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.companyBaseList?.message ?? "", type: .Failure)
                        }
                    }catch(let error){
                        print (error.localizedDescription)
                    }
                }
                }, failureBlock: {[unowned self] (errorMesssage) in
                    self.hideActivityIndicator(self.view)
                    Helper.shared.showSnackBarAlert(message: errorMesssage.description, type: .Failure)
            });
        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

