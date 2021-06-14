//
//  SEInnerTaskDetailsViewController.swift
//  Seaa
//
//  Created by user on 5/12/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class SEInnerTaskDetailsViewController: SEBaseViewController {
    @IBOutlet var tblInnerTask: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblDayValue: APPDefaultHeaderLabel!
    @IBOutlet weak var lblDateValue: APPDefaultHeaderLabel!
    
    var selectedTaskActID: String? = ""
    var selectedTaskDay: String? = ""
    var selectedTaskDate: String? = ""
    
    var firmSubActivities:SEFirmSubActivities? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblViewSetUp()
        self.btnBack.addTarget(self, action: #selector(self.btnBackTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.lblDayValue?.text = self.selectedTaskDay
        self.lblDayValue?.isHidden = true
        self.lblDateValue?.text = self.selectedTaskDate
        self.getTaskSubActivities()
    }
    
}

extension SEInnerTaskDetailsViewController {
    
    func tblViewSetUp() {
        self.tblInnerTask.backgroundColor = UIColor.clear
        self.tblInnerTask.delegate = self
        self.tblInnerTask.dataSource = self
        self.tblInnerTask.tableFooterView = UIView()
        self.tblInnerTask.separatorStyle = .none
        self.tblInnerTask.register(UINib(nibName: "SEInnerTaskDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SEInnerTaskDetailsTableViewCell")
        
    }
    
    func recentActivitySection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: SEInnerTaskDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEInnerTaskDetailsTableViewCell") as! SEInnerTaskDetailsTableViewCell
        cell.selectionStyle = .none
        cell.lblDateAndTime?.text = self.firmSubActivities?.result_array?[indexPath.row].sa_act_date
        cell.lblActivityTitle?.text = self.firmSubActivities?.result_array?[indexPath.row].sa_comment
        if self.firmSubActivities?.result_array?[indexPath.row].sub_files?.count != 0 {
            cell.btnFile.isHidden = false
        }else {
            cell.btnFile.isHidden = true
        }
        
        if indexPath.row == 0  {
            cell.vwTopDotted.isHidden = true
        }
        
        if indexPath.row == self.firmSubActivities?.result_array?.count   {
            cell.vwBottomDotted.isHidden = true
        }
        
        return cell
    }
}


extension SEInnerTaskDetailsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.firmSubActivities?.result_array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 70//UITableView.automaticDimension
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return recentActivitySection(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}



extension SEInnerTaskDetailsViewController: NavButtonActionDelegate {
    
    func backButtonPressed(_ sender: UIButton) {
        
    }
    
    func searchButtonPressed(_ sender: UIButton) {
        
    }
    
    func menuButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func clickActionDash(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "DasBoardDetailsViewController") as! DasBoardDetailsViewController
        self.navigationController?.pushViewController(initial, animated: true)
    }
    
    @IBAction func clickAlertViewTapped(_ sender: Any) {
        self.showSEAlertViewController()
    }
    
    @IBAction func tapOnViewAll(sender: UIButton) {
        debugPrint("tapOnViewAll tag:---->%d", sender.tag)
    }
    
    @objc func btnBackTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showSEAlertViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEAlertViewController") as! SEAlertViewController
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: {
            initial.setAlertMessage(message: "Task Completed", imageType: .Completed)
        })
    }
}



extension SEInnerTaskDetailsViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCollectionViewCell", for: indexPath) as! TaskCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.widthCollection.constant = (UIScreen.main.bounds.size.width / 100) * 60
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width , height: 110)
        //            let temp = self.categoryList[indexPath.row].name ?? ""
        //        let temsize = temp.widthOfString(usingFont: UIFont(name: "HelveticaNeue-Medium", size: 14)!)
        //            return CGSize(width: temsize + 35 , height: 80)
    }
}

extension SEInnerTaskDetailsViewController: MenuSelectionInfoVCDelegate {
    
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
    
    func getTaskSubActivities()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,"task_act_id" : self.selectedTaskActID as AnyObject]
            print(dictParams)
            HttpManager.sharedInstance.getFirmActiviesTemplateListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.firmSubActivities = nil
                        self.firmSubActivities = try jsonDecoder.decode(SEFirmSubActivities.self, from: responseObject as! Data)
                        if self.firmSubActivities?.key == "1319" {
                            self.tblInnerTask?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.firmSubActivities?.message ?? "", type: .Failure)
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
