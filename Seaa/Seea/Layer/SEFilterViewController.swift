//
//  SEFilterViewController.swift
//  Seaa
//
//  Created by user on 5/16/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit


struct FilterValues {
    public var filterValues: String?
    public var isSelectedFilterValues: Bool?
    init(filterValues: String?,isSelectedFilterValues: Bool?) {
        self.filterValues = filterValues
        self.isSelectedFilterValues = isSelectedFilterValues
    }
}

struct StatusFilterValues {
    public var StatusValues: String?
    public var IsSelectedStatusValues: Bool?
    init(statusValues: String?,isSelectedStatusValues: Bool?) {
        self.StatusValues = statusValues
        self.IsSelectedStatusValues = isSelectedStatusValues
    }
}

class SEFilterViewController: UIViewController {
    
    @IBOutlet weak var tblFiliter: UITableView!
    @IBOutlet weak var btnClose: UIButton!
    
    var arrayFilter:[FilterValues] = []
    var arrayStatusFilter:[StatusFilterValues] = []
    
    
    var firmEmployeeList:FirmEmployeeList? = nil
    var companyBaseList:CompanyBaseList? = nil
    var selectedCompanyID:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblFiliter?.delegate = self
        self.tblFiliter?.dataSource = self
        self.tblFiliter?.backgroundColor = UIColor.clear
        self.tblFiliter?.register(UINib(nibName: "SEAddSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddSelectionTableViewCell")
        self.tblFiliter?.rowHeight = UITableView.automaticDimension
        self.tblFiliter?.estimatedRowHeight = 300
        self.tblFiliter?.separatorColor = UIColor.clear
        self.btnClose.addTarget(self, action: #selector(self.btnCloseTapped), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.getCompanyList()
        self.getEmployeesList()
        self.arrayFilter.removeAll()
        self.arrayStatusFilter.removeAll()
        self.arrayFilter.append(FilterValues.init(filterValues: "Status", isSelectedFilterValues: true))
        self.arrayFilter.append(FilterValues.init(filterValues: "Assigned", isSelectedFilterValues: false))
        self.arrayFilter.append(FilterValues.init(filterValues: "Client", isSelectedFilterValues: false))
        self.arrayStatusFilter.append(StatusFilterValues.init(statusValues: "Completed", isSelectedStatusValues: false))
        self.arrayStatusFilter.append(StatusFilterValues.init(statusValues: "Pending", isSelectedStatusValues: false))
    }
    
}


extension SEFilterViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrayFilter.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if self.arrayFilter[section].isSelectedFilterValues == true{
                return self.arrayStatusFilter.count
            }
            return 0
        }else if section == 1 {
            if self.arrayFilter[section].isSelectedFilterValues == true{
                return self.firmEmployeeList?.result?.count ?? 0
            }
            return 0
        }else{
            if self.arrayFilter[section].isSelectedFilterValues == true{
                return self.companyBaseList?.result?.count ?? 0
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 60
        }else if section == 1 {
            return 60
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if section == 0 {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
            let label = UILabel(frame: CGRect(x:10, y:0, width:tableView.frame.size.width, height:50))
            label.font = UIFont.setAppFontSemiBoldTitle(20)
            label.textColor = UIColor.appHeadingTextColor()
            label.backgroundColor = UIColor.clear
            label.text = self.arrayFilter[section].filterValues
            let button = UIButton(frame: CGRect(x:tableView.frame.size.width - 40, y:2, width:40, height:40))
            button.tag = section
           if self.arrayFilter[section].isSelectedFilterValues == true {
                button.setImage(UIImage.init(named: "arrow_1xCollapse"), for: .normal)
            }else {
                 button.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
            }
            button.addTarget(self, action: #selector(self.btnEmployeeSelectionCollapse), for: .touchUpInside)
            view.backgroundColor = UIColor.appViewBackColor()
            view.addSubview(button)
            view.addSubview(label)
            return view
        }else if section == 1 {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
            let label = UILabel(frame: CGRect(x:10, y:0, width:tableView.frame.size.width, height:50))
            label.font = UIFont.setAppFontSemiBoldTitle(20)
            label.textColor = UIColor.appHeadingTextColor()
            label.backgroundColor = UIColor.clear
            label.text = self.arrayFilter[section].filterValues
            let button = UIButton(frame: CGRect(x:tableView.frame.size.width - 40, y:2, width:40, height:40))
            button.tag = section
            if self.arrayFilter[section].isSelectedFilterValues == true {
                button.setImage(UIImage.init(named: "arrow_1xCollapse"), for: .normal)
            }else {
                 button.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
            }
            button.addTarget(self, action: #selector(self.btnEmployeeSelectionCollapse), for: .touchUpInside)
            view.backgroundColor = UIColor.appViewBackColor()
            view.addSubview(button)
            view.addSubview(label)
            return view
        }else{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
            let label = UILabel(frame: CGRect(x:10, y:0, width:tableView.frame.size.width, height:50))
            label.font = UIFont.setAppFontSemiBoldTitle(20)
            label.textColor = UIColor.appHeadingTextColor()
            label.backgroundColor = UIColor.clear
            label.text = self.arrayFilter[section].filterValues
            let button = UIButton(frame: CGRect(x:tableView.frame.size.width - 40, y:2, width:40, height:40))
            button.tag = section
            if self.arrayFilter[section].isSelectedFilterValues == true {
                button.setImage(UIImage.init(named: "arrow_1xCollapse"), for: .normal)
            }else {
                 button.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
            }
            button.addTarget(self, action: #selector(self.btnEmployeeSelectionCollapse), for: .touchUpInside)
            view.backgroundColor = UIColor.appViewBackColor()
            view.addSubview(button)
            view.addSubview(label)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }else if indexPath.section == 1 {
            return 65
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
             let cellValue1:SEAddSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddSelectionTableViewCell", for: indexPath) as! SEAddSelectionTableViewCell
            cellValue1.btnSelection.isUserInteractionEnabled = false
            return self.setStatusSelectionCellValue(cellValue: cellValue1, indexPath: indexPath)
        }else if indexPath.section == 1 {
            let cellValue1:SEAddSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddSelectionTableViewCell", for: indexPath) as! SEAddSelectionTableViewCell
            cellValue1.btnSelection.isUserInteractionEnabled = false
            return self.setEmployeeSelectionCellValue(cellValue: cellValue1, indexPath: indexPath)
        }else{
             let cellValue1:SEAddSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddSelectionTableViewCell", for: indexPath) as! SEAddSelectionTableViewCell
            cellValue1.btnSelection.isUserInteractionEnabled = false
            return self.setCompanySelectionCellValue(cellValue: cellValue1, indexPath: indexPath)
        }
        
    }
    
    
    func setStatusSelectionCellValue(cellValue:SEAddSelectionTableViewCell,indexPath:IndexPath) -> SEAddSelectionTableViewCell {
        cellValue.btnNo.setTitle(String(format: "%d", indexPath.row + 1), for: .normal)
        cellValue.lblText?.text = self.arrayStatusFilter[indexPath.row].StatusValues
        if self.arrayStatusFilter[indexPath.row].IsSelectedStatusValues == true {
            cellValue.btnSelection?.setImage(UIImage.init(named: "checkmark"), for: .normal)
        }else {
            cellValue.btnSelection?.setImage(UIImage.init(named: "selection"), for: .normal)
        }
        cellValue.btnSelection?.tag = indexPath.row + 100
        //cellValue.btnSelection?.addTarget(self, action: #selector(self.btnSelectionTapped), for: .touchUpInside)
        return cellValue
    }
    
    func setEmployeeSelectionCellValue(cellValue:SEAddSelectionTableViewCell,indexPath:IndexPath) -> SEAddSelectionTableViewCell {
        cellValue.btnNo.setTitle(String(format: "%d", indexPath.row + 1), for: .normal)
        cellValue.lblText?.text = self.firmEmployeeList?.result?[indexPath.row].emp_name
        if self.firmEmployeeList?.result?[indexPath.row].isSelected == true {
            cellValue.btnSelection?.setImage(UIImage.init(named: "checkmark"), for: .normal)
        }else {
            cellValue.btnSelection?.setImage(UIImage.init(named: "selection"), for: .normal)
        }
        cellValue.btnSelection?.tag = indexPath.row + 100
        //cellValue.btnSelection?.addTarget(self, action: #selector(self.btnSelectionTapped), for: .touchUpInside)
        return cellValue
    }
    
    func setCompanySelectionCellValue(cellValue:SEAddSelectionTableViewCell,indexPath:IndexPath) -> SEAddSelectionTableViewCell {
        cellValue.btnNo.setTitle(String(format: "%d", indexPath.row + 1), for: .normal)
        cellValue.lblText?.text = self.companyBaseList?.result?[indexPath.row].com_name
        if self.companyBaseList?.result?[indexPath.row].isSelected == true  {
            cellValue.btnSelection?.setImage(UIImage.init(named: "checkmark"), for: .normal)
        }else {
            cellValue.btnSelection?.setImage(UIImage.init(named: "selection"), for: .normal)
        }
        cellValue.btnSelection?.tag = indexPath.row + 100
        //cellValue.btnSelection?.addTarget(self, action: #selector(self.btnSelectionTapped), for: .touchUpInside)
        return cellValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if self.arrayStatusFilter.count != 0 {
                for i in (0..<self.arrayStatusFilter.count) {
                    self.arrayStatusFilter[i].IsSelectedStatusValues = false
                }
            }
            self.arrayStatusFilter[indexPath.row].IsSelectedStatusValues = true
            self.tblFiliter.reloadData()
        }else if indexPath.section == 1 {
            if let count = self.firmEmployeeList?.result?.count {
                for i in (0..<count) {
                    self.firmEmployeeList?.result?[i].isSelected = false
                }
            }
            self.firmEmployeeList?.result?[indexPath.row].isSelected = true
            self.tblFiliter.reloadData()
        }else  {
            if let count = self.companyBaseList?.result?.count {
                for i in (0..<count) {
                    self.companyBaseList?.result?[i].isSelected = false
                }
            }
            self.companyBaseList?.result?[indexPath.row].isSelected = true
            self.tblFiliter.reloadData()
        }
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnBuyReadTapped(sender: UIButton) {
    }
 
}

extension SEFilterViewController {
    
    func getCompanyList()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject]
            print(dictParams)
            print(dictParams)
            HttpManager.sharedInstance.getCompanyListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.companyBaseList = nil
                        self.companyBaseList = try jsonDecoder.decode(CompanyBaseList.self, from: responseObject as! Data)
                        if self.companyBaseList?.key == "1313" {
                            self.tblFiliter?.reloadData()
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
                            self.tblFiliter?.reloadData()
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

extension SEFilterViewController {
    @objc func btnCloseTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func btnEmployeeSelectionCollapse(sender: UIButton) {
        if self.arrayFilter.count != 0 {
            for i in (0..<self.arrayFilter.count) {
                self.arrayFilter[i].isSelectedFilterValues = false
            }
        }
        self.arrayFilter[sender.tag].isSelectedFilterValues = true
        self.tblFiliter.reloadData()
    }
    
    

}

