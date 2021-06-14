//
//  SEClientDetailsViewController.swift
//  Seaa
//
//  Created by user on 5/22/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEClientDetailsViewController: SEBaseViewController {
    
    var arrEmployeeData:[EmployeeList] = []
    @IBOutlet weak var tblClientDetailsList: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblClientName: APPHeadingLabel!
    @IBOutlet weak var lblEmailID: APPHeadingLabel!
    @IBOutlet weak var lblPhoneNo: APPHeadingLabel!
    @IBOutlet weak var lblCompanyPAN: APPHeadingLabel!
    @IBOutlet weak var lblCompanyDIN: APPHeadingLabel!
    
    @IBOutlet weak var segmentE: UISegmentedControl!
    var strSelectedCompanyID:String? = ""
    var strSelectedTaskID:String? = ""
    
    var strSelectedTaskDate:String? = ""
    var strSelectedTaskStatus:String? = ""
    
    var companyInfoDetails:SECompanyDetailInfo? = nil
    var companyInfoTaskList:SECompanyInfoTaskList? = nil
    
    var arrCol:[SECompanyInfoTaskListArray?] = []
    var arrCompleted:[SECompanyInfoTaskListArray?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblClientDetailsList?.delegate = self
        self.tblClientDetailsList?.dataSource = self
        self.tblClientDetailsList?.backgroundColor = UIColor.clear
        self.tblClientDetailsList?.register(UINib(nibName: "SEEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEEmployeeListTableViewCell")
        self.tblClientDetailsList?.register(UINib(nibName: "SEExpandEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEExpandEmployeeListTableViewCell")
        self.tblClientDetailsList?.rowHeight = UITableView.automaticDimension
        self.tblClientDetailsList?.estimatedRowHeight = 300
        self.tblClientDetailsList?.separatorColor = UIColor.clear
        self.btnBack.addTarget(self, action: #selector(self.btnEmployeeSelectionBackTapped), for: .touchUpInside)
        self.segmentE.addTarget(self, action: #selector(self.segmentETapped), for: .valueChanged)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.lblEmailID?.text = ""
        self.lblPhoneNo?.text = ""
        self.getDetailsCompanyInfoData()
    }
    
}

extension SEClientDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
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
            cellValue.lblEmployeeNo.text = self.companyInfoDetails?.result_array?[0].com_email
            cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
        }else {
            cellValue.btnEmployeeShort.setTitle(String(format: "%@", self.arrCol[indexPath.row]?.task_id ?? ""), for: .normal)
            cellValue.lblEmployeeName.text = String(format: "%@", self.arrCol[indexPath.row]?.task_title ?? "")
            cellValue.lblEmployeeNo.text = self.companyInfoDetails?.result_array?[0].com_email
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
extension SEClientDetailsViewController {
    
    func getAddTaskList()
    {
        if Reachability.isConnectedToNetwork() == true || Reachability.isConnectedToNetwork() == false {
            self.arrEmployeeData.removeAll()
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"KN", employeeName: "Rohan", employeeNo: "Employee No: 11", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"BE", employeeName: "Rohit Mees", employeeNo: "Employee No: 12", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"KO", employeeName: "Willoam", employeeNo: "Employee No: 13", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"SN", employeeName: "Joo John", employeeNo: "Employee No: 14", employeeSelection: false))
            self.arrEmployeeData.append(EmployeeList.init(employeeShort:"BV", employeeName: "Paul Bin", employeeNo: "Employee No: 15", employeeSelection: false))
            self.tblClientDetailsList?.reloadData()
        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

extension SEClientDetailsViewController {
    
    @IBAction func btnMenuTapped() {
        let storyboard = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: SESlideMenuVC) as! SESlideMenuViewController
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: nil)
    }
}

extension SEClientDetailsViewController {
    
    @objc func btnEmployeeSelectionExpandDetails(sender: UIButton) {
        self.arrEmployeeData[sender.tag].employeeSelection = true
        self.tblClientDetailsList.reloadData()
    }
    
    @objc func btnEmployeeSelectionBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func segmentETapped(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.tblClientDetailsList?.reloadData()
        }else {
            self.tblClientDetailsList?.reloadData()
        }
    }
    
     func getDetailsCompanyInfoData()
     {
        
         if Reachability.isConnectedToNetwork() == true {
             showActivityIndicator(self.view)
             var dictParams = [String : Any]()
             dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,
                            "com_id" : self.strSelectedCompanyID as AnyObject]
             print(dictParams)
             HttpManager.sharedInstance.getCompanyInfoData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                 self.hideActivityIndicator(self.view)
                 if success {
                     do {
                         let jsonDecoder = JSONDecoder()
                         self.companyInfoDetails = nil
                         self.companyInfoDetails = try jsonDecoder.decode(SECompanyDetailInfo.self, from: responseObject as! Data)
                         if self.companyInfoDetails?.key == "1320" {
                            self.lblClientName?.text = self.companyInfoDetails?.result_array?[0].com_name ?? ""

                            self.lblEmailID?.text = self.companyInfoDetails?.result_array?[0].com_email ?? ""
                            self.lblPhoneNo?.text = self.companyInfoDetails?.result_array?[0].com_phone ?? ""
                            self.lblCompanyPAN?.text = self.companyInfoDetails?.result_array?[0].com_pan ?? ""
                            self.lblCompanyDIN?.text = self.companyInfoDetails?.result_array?[0].com_din_exp ?? ""
                             self.getDetailsCompanyTaskList()
                         }else {
                             Helper.shared.showSnackBarAlert(message: self.companyInfoDetails?.message ?? "", type: .Failure)
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
    
    func getDetailsCompanyTaskList()
    {
        if Reachability.isConnectedToNetwork() == true {
            self.showActivityIndicator(self.view)
            self.arrCol.removeAll()
            self.arrCompleted.removeAll()
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,
                           "com_id" : self.strSelectedCompanyID as AnyObject]
            print(dictParams)
            HttpManager.sharedInstance.getCompanyInfoTaskListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.companyInfoTaskList = nil
                        self.companyInfoTaskList = try jsonDecoder.decode(SECompanyInfoTaskList.self, from: responseObject as! Data)
                        if self.companyInfoTaskList?.key == "1322" {
                            if let countValue = self.companyInfoTaskList?.result_array?.count {
                                for i in (0..<countValue) {
                                    if self.companyInfoTaskList?.result_array?[i].status == "0" {
                                        self.arrCompleted.append(self.companyInfoTaskList?.result_array?[i])
                                        
                                    }else {
                                        self.arrCol.append(self.companyInfoTaskList?.result_array?[i])
                                    }
                                }
                            }
                            self.tblClientDetailsList?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.companyInfoTaskList?.message ?? "", type: .Failure)
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
