//
//  DashBoardViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

class DashBoardViewController: SEBaseViewController {
    @IBOutlet var dashboardTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
}

extension DashBoardViewController {
    
    func tblViewSetUp() {
        self.dashboardTableView.backgroundColor = UIColor.clear
        self.dashboardTableView.delegate = self
        self.dashboardTableView.dataSource = self
        self.dashboardTableView.tableFooterView = UIView()
        self.dashboardTableView.separatorStyle = .none
        self.dashboardTableView.register(UINib(nibName: "DateFilterCell", bundle: nil), forCellReuseIdentifier: "DateFilterCell")
        self.dashboardTableView.register(UINib(nibName: "DashboardChartCell", bundle: nil), forCellReuseIdentifier: "DashboardChartCell")

        let headerNib = UINib.init(nibName: "DashboardTableHeader", bundle: Bundle.main)
        self.dashboardTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "DashboardTableHeader")
        self.dashboardTableView.register(UINib(nibName: "OverdueTaskCell", bundle: nil), forCellReuseIdentifier: "OverdueTaskCell")
        self.dashboardTableView.register(UINib(nibName: "RecentActivitiesCell", bundle: nil), forCellReuseIdentifier: "RecentActivitiesCell")

        
    }
    
    func sectionOneCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return dateFilterCell(tableView: tableView, indexPath: indexPath)
        default:
            return dashboardCartCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
    func overdueTaskCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return callOverdueCell(tableView: tableView, indexPath: indexPath)
    }
    
    func callOverdueCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: OverdueTaskCell = tableView.dequeueReusableCell(withIdentifier: "OverdueTaskCell") as! OverdueTaskCell
        cell.selectionStyle = .none
        
        cell.overdueCollectionView?.register(UINib(nibName: "TaskCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "TaskCollectionViewCell")
        cell.overdueCollectionView.dataSource = self
        cell.overdueCollectionView?.delegate = self
        
        return cell
    }
    
    func dateFilterCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: DateFilterCell = tableView.dequeueReusableCell(withIdentifier: "DateFilterCell") as! DateFilterCell
        cell.selectionStyle = .none
        return cell
    }
    
    func dashboardCartCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: DashboardChartCell = tableView.dequeueReusableCell(withIdentifier: "DashboardChartCell") as! DashboardChartCell
        cell.selectionStyle = .none
        return cell
    }
    
    func recentActivitySection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: RecentActivitiesCell = tableView.dequeueReusableCell(withIdentifier: "RecentActivitiesCell") as! RecentActivitiesCell
        cell.selectionStyle = .none
        
        if indexPath.row == 0  {
            cell.vwTopDotted.isHidden = true
        }
        
        if indexPath.row == 4  {
            cell.vwBottomDotted.isHidden = true
        }
        
        return cell
    }
}

extension DashBoardViewController{
    @IBAction func tapOnViewAll(sender: UIButton) {
        debugPrint("tapOnViewAll tag:---->%d", sender.tag)
    }
}

extension DashBoardViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 5
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 70//UITableView.automaticDimension
        }
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DashboardTableHeader") as! DashboardTableHeader
        switch section {
        case 1:
            headerView.lblTitle.text = "Overdue Task"
        case 2:
            headerView.lblTitle.text = "Recent Activities"
        default:
            headerView.lblTitle.text = ""
        }
        headerView.btnViewAll.tag = section
        headerView.btnViewAll.addTarget(self, action: #selector(self.tapOnViewAll(sender:)), for: .touchUpInside)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return sectionOneCell(tableView: tableView, indexPath: indexPath)
        case 1:
            return overdueTaskCell(tableView: tableView, indexPath: indexPath)
        case 2:
            return recentActivitySection(tableView: tableView, indexPath: indexPath)
        default:
            return sectionOneCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
}



extension DashBoardViewController: NavButtonActionDelegate {
    
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
    
    
    func showSEAlertViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SEAlertViewController") as! SEAlertViewController
        initial.modalPresentationStyle = .overFullScreen
        self.present(initial, animated: true, completion: {
            initial.setAlertMessage(message: "Task Completed", imageType: .Completed)
        })
    }
}



extension DashBoardViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
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

extension DashBoardViewController:MenuSelectionInfoVCDelegate {
    
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
