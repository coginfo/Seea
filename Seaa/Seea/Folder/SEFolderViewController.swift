//
//  SEFolderViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEFolderViewController: SEBaseViewController {
    
    var arrEmployeeData:[EmployeeList] = []
    @IBOutlet weak var tblClientList: UITableView!
    var companyBaseList:CompanyBaseList? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblClientList?.delegate = self
        self.tblClientList?.dataSource = self
        self.tblClientList?.backgroundColor = UIColor.clear
        self.tblClientList?.register(UINib(nibName: "SEEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEEmployeeListTableViewCell")
        self.tblClientList?.register(UINib(nibName: "SEExpandEmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "SEExpandEmployeeListTableViewCell")
        self.tblClientList?.rowHeight = UITableView.automaticDimension
        self.tblClientList?.estimatedRowHeight = 300
        self.tblClientList?.separatorColor = UIColor.clear
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.getCompanyList()
    }
    
}

extension SEFolderViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.companyBaseList?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue:SEEmployeeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEEmployeeListTableViewCell", for: indexPath) as! SEEmployeeListTableViewCell
        cellValue.btnEmployeeShort.setTitle(String(format: "%@", self.companyBaseList?.result?[indexPath.row].com_name?.prefix(2).capitalized ?? ""), for: .normal)
        cellValue.lblEmployeeName.text = String(format: "%@", self.companyBaseList?.result?[indexPath.row].com_name ?? "")
        cellValue.lblEmployeeNo.text = String(format: "%@", self.companyBaseList?.result?[indexPath.row].com_email ?? "")
        cellValue.btnEmployeeSelection.setImage(UIImage.init(named: "arrow_1x"), for: .normal)
        cellValue.btnEmployeeSelection.tag = indexPath.row
        cellValue.btnEmployeeSelection.addTarget(self, action: #selector(self.btnEmployeeSelectionExpand), for: .touchUpInside)
        return cellValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEClientDetailsViewController") as! SEClientDetailsViewController
        initial.strSelectedCompanyID = self.companyBaseList?.result?[indexPath.row].com_id
        self.navigationController?.pushViewController(initial, animated: true)
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnBuyReadTapped(sender: UIButton) {
    }
    
    
    
}


extension SEFolderViewController {
    
    @IBAction func btnMenuTapped() {
        let storyboard = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: SESlideMenuVC) as! SESlideMenuViewController
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: nil)
    }
}

extension SEFolderViewController {
    
    @objc func btnEmployeeSelectionCollapse(sender: UIButton) {
        
    }
    
    @objc func btnEmployeeSelectionExpand(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEClientDetailsViewController") as! SEClientDetailsViewController
        initial.strSelectedCompanyID = self.companyBaseList?.result?[sender.tag].com_id
        self.navigationController?.pushViewController(initial, animated: true)
    }
    
    @objc func btnEmployeeDetailsTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEClientDetailsViewController") as! SEClientDetailsViewController
        initial.strSelectedCompanyID = self.companyBaseList?.result?[sender.tag].com_id
        self.navigationController?.pushViewController(initial, animated: true)
    }
}
extension SEFolderViewController {
    
    @IBAction func btnLogOutTapped(_ sender: Any) {
        let viewController = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil).instantiateViewController(withIdentifier: "SENavigationViewController") as! SENavigationViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
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
                            self.tblClientList?.reloadData()
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
