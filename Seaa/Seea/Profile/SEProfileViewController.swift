//
//  SEProfileViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

struct EmployeeList {
    
    public var employeeShort: String?
    public var employeeName: String?
    public var employeeNo: String?
    public var employeeSelection: Bool?
    
    
    init(employeeShort: String?,employeeName: String?, employeeNo: String?, employeeSelection: Bool?) {
        self.employeeShort = employeeShort
        self.employeeName = employeeName
        self.employeeNo = employeeNo
        self.employeeSelection = employeeSelection
    }
}
class SEProfileViewController: SEBaseViewController {
    
    var arrEmployeeData:[EmployeeList] = []
    @IBOutlet weak var tblEmployeeList: UITableView!
    var firmEmployeeList:FirmEmployeeList? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblEmployeeList?.delegate = self
        self.tblEmployeeList?.dataSource = self
        self.tblEmployeeList?.backgroundColor = UIColor.clear
        self.tblEmployeeList?.register(UINib(nibName: "SEEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEEmployeeListTableViewCell")
        self.tblEmployeeList?.register(UINib(nibName: "SEExpandEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEExpandEmployeeListTableViewCell")
        self.tblEmployeeList?.rowHeight = UITableView.automaticDimension
        self.tblEmployeeList?.estimatedRowHeight = 300
        self.tblEmployeeList?.separatorColor = UIColor.clear
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.getEmployeesList()
    }
    
}

extension SEProfileViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firmEmployeeList?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.firmEmployeeList?.result?[indexPath.row].isSelected == true {
            return 100
        }else {
            return 180
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.firmEmployeeList?.result?[indexPath.row].isSelected == true {
            let cellValue:SEExpandEmployeeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEExpandEmployeeListTableViewCell", for: indexPath) as! SEExpandEmployeeListTableViewCell
            cellValue.btnEmployeeShort.setTitle(String(format: "%@", self.firmEmployeeList?.result?[indexPath.row].emp_name?.prefix(2).capitalized ?? ""), for: .normal)
            cellValue.lblEmployeeName.text = String(format: "%@", self.firmEmployeeList?.result?[indexPath.row].emp_name ?? "")
            cellValue.lblEmployeeNo.text = String(format: "Employee No: %@", self.firmEmployeeList?.result?[indexPath.row].employee_id ?? "")
            cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
            cellValue.lblTodayTask.text = String(format: "%d", self.firmEmployeeList?.result?[indexPath.row].emp_priority_task ?? "")
            cellValue.lblPendingTask.text = String(format: "%d", self.firmEmployeeList?.result?[indexPath.row].emp_pending_task ?? "")
            cellValue.lblCompleteTask.text = String(format: "%d", self.firmEmployeeList?.result?[indexPath.row].emp_completed_task ?? "")
            cellValue.btnEmployeeSelection.tag = indexPath.row
            cellValue.btnEmployeeSelection.addTarget(self, action: #selector(self.btnEmployeeSelectionCollapse), for: .touchUpInside)
            cellValue.btnViewDetails.tag = indexPath.row
            cellValue.btnViewDetails.addTarget(self, action: #selector(self.btnEmployeeDetailsTapped), for: .touchUpInside)
            
            return cellValue
        }else {
            let cellValue:SEEmployeeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEEmployeeListTableViewCell", for: indexPath) as! SEEmployeeListTableViewCell
            cellValue.btnEmployeeShort.setTitle(String(format: "%@", self.firmEmployeeList?.result?[indexPath.row].emp_name?.prefix(2).capitalized ?? ""), for: .normal)
            cellValue.lblEmployeeName.text = String(format: "%@", self.firmEmployeeList?.result?[indexPath.row].emp_name ?? "")
            cellValue.lblEmployeeNo.text = String(format: "Employee No: %@", self.firmEmployeeList?.result?[indexPath.row].employee_id ?? "")
            cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
            cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1xCollapse"), for: .normal)
            cellValue.btnEmployeeSelection.tag = indexPath.row
            cellValue.btnEmployeeSelection.addTarget(self, action: #selector(self.btnEmployeeSelectionExpand), for: .touchUpInside)
            return cellValue
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.firmEmployeeList?.result?[indexPath.row].isSelected = true
        self.tblEmployeeList.reloadData()
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnBuyReadTapped(sender: UIButton) {
    }
    
    
    
}
extension SEProfileViewController {
    
    func getAddTaskList()
    {
        if Reachability.isConnectedToNetwork() == true || Reachability.isConnectedToNetwork() == false {
            self.arrEmployeeData.removeAll()
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"KN", employeeName: "Kiran Nad", employeeNo: "Employee No: 11", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"BE", employeeName: "Binoy ", employeeNo: "Employee No: 12", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"KO", employeeName: "Kiran Oren", employeeNo: "Employee No: 13", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"SN", employeeName: "Simay", employeeNo: "Employee No: 14", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"BV", employeeName: "Bimmon", employeeNo: "Employee No: 15", employeeSelection: false))
            self.tblEmployeeList?.reloadData()
        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

extension SEProfileViewController:MenuSelectionInfoVCDelegate {
    
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

extension SEProfileViewController {
    
    @objc func btnEmployeeSelectionCollapse(sender: UIButton) {
        self.firmEmployeeList?.result?[sender.tag].isSelected = false
        self.tblEmployeeList.reloadData()
    }
    
    @objc func btnEmployeeSelectionExpand(sender: UIButton) {
        self.firmEmployeeList?.result?[sender.tag].isSelected = true
        self.tblEmployeeList.reloadData()
    }
    
    @objc func btnEmployeeDetailsTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEProfileDetailsViewController") as! SEProfileDetailsViewController
        initial.strSelectedEmpID = String(format: "%@", self.firmEmployeeList?.result?[sender.tag].employee_id ?? "")
        initial.strSelectedTaskStatus = String(format: "%@", self.firmEmployeeList?.result?[sender.tag].emp_status ?? "")
        initial.strSelectedTaskDate = String(format: "%@", self.firmEmployeeList?.result?[sender.tag].emp_current_task?.ta_due_date ?? "")
        self.navigationController?.pushViewController(initial, animated: true)
    }
    
    func getEmployeesList()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject]
            print(dictParams)
            print(dictParams)
            HttpManager.sharedInstance.getFirmEmployeesListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.firmEmployeeList = nil
                        self.firmEmployeeList = try jsonDecoder.decode(FirmEmployeeList.self, from: responseObject as! Data)
                        if self.firmEmployeeList?.key == "1201" {
                            self.tblEmployeeList?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.firmEmployeeList?.message ?? "", type: .Failure)
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
