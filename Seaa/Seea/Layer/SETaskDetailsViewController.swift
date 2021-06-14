//
//  SETaskDetailsViewController.swift
//  Seaa
//
//  Created by user on 5/12/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SETaskDetailsViewController: SEBaseViewController {
    
    var arrEmployeeData:[EmployeeList] = []
    @IBOutlet weak var tblEmployeeDetailsList: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var lblTaskTitle: APPDefaultHeaderLabel!
    @IBOutlet weak var lblCompanyName: APPHeadingLabel!
    @IBOutlet weak var lblEmployeeName: APPHeadingLabel!
    @IBOutlet weak var lblDueDate: APPHeadingLabel!
    @IBOutlet weak var lblTaskComments: APPHeadingLabel!
    
    var firmTaskDetails: SEFirmTaskDetails? = nil
    var selectedFirmTaskID: String? = ""
    var firmTemplateList: SEFirmTemplateList? = nil
    var selectedFirmTemplateID: String? = "2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblEmployeeDetailsList?.delegate = self
        self.tblEmployeeDetailsList?.dataSource = self
        self.tblEmployeeDetailsList?.backgroundColor = UIColor.clear
        self.tblEmployeeDetailsList?.register(UINib(nibName: "SEAddSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddSelectionTableViewCell")
        self.tblEmployeeDetailsList?.rowHeight = UITableView.automaticDimension
        self.tblEmployeeDetailsList?.estimatedRowHeight = 300
        self.tblEmployeeDetailsList?.separatorColor = UIColor.clear
        self.btnBack.addTarget(self, action: #selector(self.btnEmployeeSelectionBackTapped), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //self.getAddTaskList()
        self.getDetailsTaskList()
        self.lblTaskTitle?.text = ""
        self.lblCompanyName?.text = ""
        self.lblEmployeeName?.text = ""
        self.lblTaskComments?.text = ""
        self.lblDueDate?.text = ""
    }
    
}

extension SETaskDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firmTemplateList?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue1:SEAddSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddSelectionTableViewCell", for: indexPath) as! SEAddSelectionTableViewCell
        cellValue1.btnNo.setTitle(String(format: "%d", indexPath.row + 1), for: .normal)
        cellValue1.lblText?.text = self.firmTemplateList?.result?[indexPath.row].tmp_task_name
        cellValue1.btnSelection.setImage(UIImage.init(named: "checkmark"), for: .normal)
        return cellValue1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEInnerTaskDetailsViewController") as! SEInnerTaskDetailsViewController
        initial.selectedTaskActID = self.firmTemplateList?.result?[indexPath.row].tmp_task_id
        initial.selectedTaskDate = self.firmTemplateList?.result?[indexPath.row].tem_act_status?.act_date_added
        self.navigationController?.pushViewController(initial, animated: true)
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnBuyReadTapped(sender: UIButton) {
    }
    
    
    
}
extension SETaskDetailsViewController {
    
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

extension SETaskDetailsViewController:MenuSelectionInfoVCDelegate {
    
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

extension SETaskDetailsViewController {
    
    @objc func btnEmployeeSelectionExpandDetails(sender: UIButton) {
        self.arrEmployeeData[sender.tag].employeeSelection = true
        self.tblEmployeeDetailsList.reloadData()
    }
    
    @objc func btnEmployeeSelectionBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SETaskDetailsViewController {
    
    func getDetailsTaskList()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,"task_id" : self.selectedFirmTaskID as AnyObject,
            ]
            print(dictParams)
            HttpManager.sharedInstance.getFirmTaskDetailsData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.firmTaskDetails = nil
                        self.firmTaskDetails = try jsonDecoder.decode(SEFirmTaskDetails.self, from: responseObject as! Data)
                        if self.firmTaskDetails?.key == "1305" {
                            self.tblEmployeeDetailsList?.reloadData()
                            self.lblTaskTitle?.text = self.firmTaskDetails?.result?[0].task_title
                            self.lblCompanyName?.text = self.firmTaskDetails?.result?[0].com_name
                            self.lblEmployeeName?.text = self.firmTaskDetails?.result?[0].emp_name
                            self.lblTaskComments?.text = self.firmTaskDetails?.result?[0].comments
                            self.lblDueDate?.text = self.firmTaskDetails?.result?[0].due_date
                            self.selectedFirmTemplateID = self.firmTaskDetails?.result?[0].template
                            if self.firmTaskDetails?.result?[0].status == "1" {
                                self.btnStatus?.backgroundColor = UIColor.init(hex: "#ffdf9c")
                            }else {
                                self.btnStatus?.backgroundColor = UIColor.init(hex: "#07ab17")
                                self.btnStatus?.setTitle("Done", for: .normal)
                            }
                            self.getFirmTemplateList()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.firmTaskDetails?.message ?? "", type: .Failure)
                            self.getFirmTemplateList()
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
    
    func getFirmTemplateList()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,"task_id" : self.selectedFirmTaskID as AnyObject,
                           "template_id" : self.selectedFirmTemplateID as AnyObject
            ]
            print(dictParams)
            HttpManager.sharedInstance.getFirmTemplateListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.firmTemplateList = nil
                        self.firmTemplateList = try jsonDecoder.decode(SEFirmTemplateList.self, from: responseObject as! Data)
                        if self.firmTemplateList?.key == "1317" {
                            self.tblEmployeeDetailsList?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.firmTaskDetails?.message ?? "", type: .Failure)
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
