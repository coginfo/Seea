//
//  SEProfileDetailsViewController.swift
//  Seaa
//
//  Created by user on 5/11/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit



class SEProfileDetailsViewController: SEBaseViewController {
    
    var arrEmployeeData:[EmployeeList] = []
    @IBOutlet weak var tblEmployeeDetailsList: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblEmailID: APPHeadingLabel!
    @IBOutlet weak var lblPhoneNo: APPHeadingLabel!
    @IBOutlet weak var segmentE: UISegmentedControl!
    var strSelectedEmpID:String? = ""
    var strSelectedTaskID:String? = ""
    
    var strSelectedTaskDate:String? = ""
    var strSelectedTaskStatus:String? = ""
    
    var firmEmployeeDetail:SEFirmEmployeeDetails? = nil
    var firmEmployeeActiveTaskList:SEFirmEmployeeActiveTaskList? = nil
    
    var arrCol:[FirmEmployeeActiveTaskListResult?] = []
    var arrCompleted:[FirmEmployeeActiveTaskListResult?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblEmployeeDetailsList?.delegate = self
        self.tblEmployeeDetailsList?.dataSource = self
        self.tblEmployeeDetailsList?.backgroundColor = UIColor.clear
        self.tblEmployeeDetailsList?.register(UINib(nibName: "SEEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEEmployeeListTableViewCell")
        self.tblEmployeeDetailsList?.register(UINib(nibName: "SEExpandEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEExpandEmployeeListTableViewCell")
        self.tblEmployeeDetailsList?.rowHeight = UITableView.automaticDimension
        self.tblEmployeeDetailsList?.estimatedRowHeight = 300
        self.tblEmployeeDetailsList?.separatorColor = UIColor.clear
        self.btnBack.addTarget(self, action: #selector(self.btnEmployeeSelectionBackTapped), for: .touchUpInside)
        self.segmentE.addTarget(self, action: #selector(self.segmentETapped), for: .valueChanged)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.lblEmailID?.text = ""
        self.lblPhoneNo?.text = ""
        self.getDetailsEmployee()
    }
    
}

extension SEProfileDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.segmentE.selectedSegmentIndex == 0 {
            return self.arrCompleted.count
        }
        return self.arrCol.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue:SEEmployeeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEEmployeeListTableViewCell", for: indexPath) as! SEEmployeeListTableViewCell
        
        if self.segmentE.selectedSegmentIndex == 0 {
            cellValue.btnEmployeeShort.setTitle(String(format: "%@", self.arrCompleted[indexPath.row]?.task_id ?? ""), for: .normal)
            cellValue.lblEmployeeName.text = String(format: "%@", self.arrCompleted[indexPath.row]?.task_title ?? "")
            cellValue.lblEmployeeNo.text = self.firmEmployeeDetail?.result?.emp_email
            cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
        }else {
            cellValue.btnEmployeeShort.setTitle(String(format: "%@", self.arrCol[indexPath.row]?.task_id ?? ""), for: .normal)
            cellValue.lblEmployeeName.text = String(format: "%@", self.arrCol[indexPath.row]?.task_title ?? "")
            cellValue.lblEmployeeNo.text = self.firmEmployeeDetail?.result?.emp_email
            cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
        }
        
        
        
        cellValue.btnEmployeeSelection.tag = indexPath.row
        cellValue.btnEmployeeSelection.addTarget(self, action: #selector(self.btnEmployeeSelectionExpandDetails), for: .touchUpInside)
        return cellValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEInnerTaskDetailsViewController") as! SEInnerTaskDetailsViewController
        self.navigationController?.pushViewController(initial, animated: true)
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnBuyReadTapped(sender: UIButton) {
    }
    
    
    
}
extension SEProfileDetailsViewController {
    
    func getAddTaskList()
    {
        if Reachability.isConnectedToNetwork() == true || Reachability.isConnectedToNetwork() == false {
            self.arrEmployeeData.removeAll()
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"KN", employeeName: "Rohan", employeeNo: "Employee No: 11", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"BE", employeeName: "Rohit Mees", employeeNo: "Employee No: 12", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"KO", employeeName: "Willoam", employeeNo: "Employee No: 13", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"SN", employeeName: "Joo John", employeeNo: "Employee No: 14", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"BV", employeeName: "Paul Bin", employeeNo: "Employee No: 15", employeeSelection: false))
            self.tblEmployeeDetailsList?.reloadData()
        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

extension SEProfileDetailsViewController:MenuSelectionInfoVCDelegate {
    
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
        initial.modalPresentationStyle = .overFullScreen
        initial.delegate = self
        self.present(initial, animated: true, completion: nil)
    }
}

extension SEProfileDetailsViewController {
    
    @objc func btnEmployeeSelectionExpandDetails(sender: UIButton) {
        self.arrEmployeeData[sender.tag].employeeSelection = true
        self.tblEmployeeDetailsList.reloadData()
    }
    
    @objc func btnEmployeeSelectionBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func segmentETapped(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.tblEmployeeDetailsList?.reloadData()
        }else {
            self.tblEmployeeDetailsList?.reloadData()
        }
    }
    
     func getDetailsEmployee()
     {
        
         if Reachability.isConnectedToNetwork() == true {
             showActivityIndicator(self.view)
             var dictParams = [String : Any]()
             dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,
                            "emp_id" : self.strSelectedEmpID as AnyObject]
             print(dictParams)
             HttpManager.sharedInstance.getDetailsEmployeesData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                 self.hideActivityIndicator(self.view)
                 if success {
                     do {
                         let jsonDecoder = JSONDecoder()
                         self.firmEmployeeDetail = nil
                         self.firmEmployeeDetail = try jsonDecoder.decode(SEFirmEmployeeDetails.self, from: responseObject as! Data)
                         if self.firmEmployeeDetail?.key == "1207" {
                            self.lblEmailID?.text = self.firmEmployeeDetail?.result?.emp_email ?? ""
                            self.lblPhoneNo?.text = self.firmEmployeeDetail?.result?.emp_phone ?? ""
                            self.strSelectedTaskID = self.firmEmployeeDetail?.result?.emp_auto_id ?? ""
                             self.getDetailsEmployeesTaskList()
                         }else {
                             Helper.shared.showSnackBarAlert(message: self.firmEmployeeDetail?.message ?? "", type: .Failure)
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
    
    func getDetailsEmployeesTaskList()
    {
        if Reachability.isConnectedToNetwork() == true {
            self.showActivityIndicator(self.view)
            self.arrCol.removeAll()
            self.arrCompleted.removeAll()
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,
                           "emp_id" : "10" as AnyObject,
                           "task_date" : self.strSelectedTaskDate as AnyObject,
                           "task_status" : "" as AnyObject]
            print(dictParams)
            HttpManager.sharedInstance.getDetailsEmployeesTaskListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.firmEmployeeActiveTaskList = nil
                        self.firmEmployeeActiveTaskList = try jsonDecoder.decode(SEFirmEmployeeActiveTaskList.self, from: responseObject as! Data)
                        if self.firmEmployeeActiveTaskList?.key == "1209" {
                            if let countValue = self.firmEmployeeActiveTaskList?.result?.count {
                                for i in (0..<countValue) {
                                    if self.firmEmployeeActiveTaskList?.result?[i].status == "0" {
                                        self.arrCompleted.append(self.firmEmployeeActiveTaskList?.result?[i])
                                        
                                    }else {
                                        self.arrCol.append(self.firmEmployeeActiveTaskList?.result?[i])
                                    }
                                }
                            }
                            self.tblEmployeeDetailsList?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.firmEmployeeActiveTaskList?.message ?? "", type: .Failure)
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
