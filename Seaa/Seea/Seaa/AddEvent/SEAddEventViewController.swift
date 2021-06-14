//
//  AddEventViewController.swift
//  Seaa
//
//  Created by user on 2/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit
import SwiftyJSON
import DatePicker


struct AddEventCellType {
    
    public var cellTitle: String?
    public var cellPlaceHolder: String?
    public var imageType: SEAddCellImageType?
    public var cellType: SEAddCellType?
    public var cellTagValue: Int?
    public var cellValue: String?
    
    init(cellTitle: String?,cellPlaceHolder: String?, imageType: SEAddCellImageType?, cellType: SEAddCellType?, cellTagValue: Int,cellValue: String?) {
        self.cellTitle = cellTitle
        self.cellPlaceHolder = cellPlaceHolder
        self.imageType = imageType
        self.cellType = cellType
        self.cellTagValue = cellTagValue
        self.cellValue = cellValue
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
    var arrJobType = ["Internal","External"]
    var arrPriority = ["Low","Medium","High"]
    var companyBaseList:CompanyBaseList? = nil
    var templateList:TemplateList? = nil
    var teamList:TeamList? = nil
    
    var selectedTag:Int = 0
    var selectedJobType:String = ""
    var selectedCompanyID:String = ""
    var selectedTemplateID:String = ""
    var selectedPriorityID:String = ""
    var selectedTeamID:String = ""
    
    let salutations = ["", "Mr.", "Ms.", "Mrs."]
    
    
    @IBOutlet weak var tblAddEventList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblAddEventList?.delegate = self
        self.tblAddEventList?.dataSource = self
        self.tblAddEventList?.backgroundColor = UIColor.clear
        self.tblAddEventList.register(UINib(nibName: "SEAddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddEventTableViewCell")
        self.tblAddEventList.register(UINib(nibName: "SETitleAddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "SETitleAddEventTableViewCell")
        self.tblAddEventList.register(UINib(nibName: "SEAddSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddSelectionTableViewCell")
        self.tblAddEventList.register(UINib(nibName: "SEAddCommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddCommentsTableViewCell")
        self.tblAddEventList.register(UINib(nibName: "SEAddCommentsButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddCommentsButtonTableViewCell")
        self.tblAddEventList.rowHeight = UITableView.automaticDimension
        self.tblAddEventList.estimatedRowHeight = 300
        self.tblAddEventList.separatorColor = UIColor.clear
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.getAddTaskList()
        self.getCompanyList()
    }
    
}

extension SEAddEventViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.arrEventData.count
        }else if section == 1 {
            return self.teamList?.result?.count ?? 0
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else if section == 1 {
            return 50
        }else{
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if section == 0 {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
            let label = UILabel(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
            view.addSubview(label)
            view.backgroundColor = UIColor.orange
            return view
        }else if section == 1 {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
            let label = UILabel(frame: CGRect(x:10, y:0, width:tableView.frame.size.width, height:50))
            label.font = UIFont.setAppFontSemiBoldTitle(20)
            label.textColor = UIColor.appHeadingTextColor()
            label.backgroundColor = UIColor.clear
            label.text = "Select Team"
            view.addSubview(label)
            return view
        }else{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
            let label = UILabel(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
            view.addSubview(label)
            view.backgroundColor = UIColor.clear
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
            if self.arrEventData[indexPath.row].cellType == .Normal{
                let cellValue:SEAddEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddEventTableViewCell", for: indexPath) as! SEAddEventTableViewCell
                return self.setInputEventCellValue(cellValue: cellValue, indexPath: indexPath)
            }else if self.arrEventData[indexPath.row].cellType == .Comments{
                let cellValue:SEAddCommentsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddCommentsTableViewCell", for: indexPath) as! SEAddCommentsTableViewCell
                cellValue.txtComments?.placeholder = self.arrEventData[indexPath.row].cellPlaceHolder
                cellValue.txtComments?.tag = indexPath.row
                cellValue.txtComments?.delegate = self
                return cellValue
            }else {
                let cellValue1:SETitleAddEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SETitleAddEventTableViewCell", for: indexPath) as! SETitleAddEventTableViewCell
                return self.setInputTitleEventCellValue(cellValue1: cellValue1, indexPath: indexPath)
            }
        }else if indexPath.section == 1 {
            let cellValue1:SEAddSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddSelectionTableViewCell", for: indexPath) as! SEAddSelectionTableViewCell
            return self.setSelectionCellValue(cellValue: cellValue1, indexPath: indexPath)
        }else{
            let cellValue1:SEAddCommentsButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddCommentsButtonTableViewCell", for: indexPath) as! SEAddCommentsButtonTableViewCell
            cellValue1.btnCreateTask.addTarget(self, action: #selector(self.btnCreateTaskTapped), for: .touchUpInside)
            return cellValue1
        }
        
    }
    
    
    func setSelectionCellValue(cellValue:SEAddSelectionTableViewCell,indexPath:IndexPath) -> SEAddSelectionTableViewCell {
        cellValue.btnNo.setTitle(String(format: "%d", indexPath.row + 1), for: .normal)
        cellValue.lblText?.text = self.teamList?.result?[indexPath.row].team_name
        if self.teamList?.result?[indexPath.row].isSelected == true {
            cellValue.btnSelection?.setImage(UIImage.init(named: "checkmark"), for: .normal)
        }else {
            cellValue.btnSelection?.setImage(UIImage.init(named: "selection"), for: .normal)
        }
        cellValue.btnSelection?.tag = indexPath.row + 100
        cellValue.btnSelection?.addTarget(self, action: #selector(self.btnSelectionTapped), for: .touchUpInside)
        return cellValue
    }
    func setInputEventCellValue(cellValue:SEAddEventTableViewCell,indexPath:IndexPath) -> SEAddEventTableViewCell{
        
        if self.arrEventData[indexPath.row].imageType == .Calendar{
            cellValue.addEventImageview?.image = self.getImage(imgName: CALENDAR_CELL)
        }
        else if self.arrEventData[indexPath.row].imageType == .DropDown{
            cellValue.addEventImageview?.image = self.getImage(imgName: DROPDOWN_CELL)
        }else {
            cellValue.addEventImageview?.image = self.getImage(imgName: "")
        }
        cellValue.txtAddEvent?.delegate = self
        cellValue.txtAddEvent?.text = self.arrEventData[indexPath.row].cellValue
        cellValue.txtAddEvent?.placeholder = self.arrEventData[indexPath.row].cellPlaceHolder
        cellValue.txtAddEvent?.tag = self.arrEventData[indexPath.row].cellTagValue ?? 0
        cellValue.selectionStyle = .none
        return cellValue
    }
    func setInputTitleEventCellValue(cellValue1:SETitleAddEventTableViewCell,indexPath:IndexPath) -> SETitleAddEventTableViewCell{
        if self.arrEventData[indexPath.row].imageType == .Calendar{
            cellValue1.addTitleEventImageview?.image = self.getImage(imgName: CALENDAR_CELL)
        }
        else if self.arrEventData[indexPath.row].imageType == .DropDown{
            cellValue1.addTitleEventImageview?.image = self.getImage(imgName: DROPDOWN_CELL)
        }else {
            cellValue1.addTitleEventImageview?.image = self.getImage(imgName: "")
        }
        cellValue1.lblTitleAddEvent?.text = self.arrEventData[indexPath.row].cellTitle
        cellValue1.selectionStyle = .none
        cellValue1.txtTitleAddEvent?.delegate = self
        cellValue1.txtTitleAddEvent?.placeholder = self.arrEventData[indexPath.row].cellPlaceHolder
        cellValue1.txtTitleAddEvent?.text = self.arrEventData[indexPath.row].cellValue
        cellValue1.txtTitleAddEvent?.tag = self.arrEventData[indexPath.row].cellTagValue ?? 0
        return cellValue1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let countValue = self.teamList?.result?.count {
                for i in (0..<countValue) {
                  self.teamList?.result?[i].isSelected = false
                }
            }
            self.teamList?.result?[indexPath.row].isSelected = true
            self.selectedTeamID = self.teamList?.result?[indexPath.row].team_id ?? ""
            self.tblAddEventList?.reloadData()
        }
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
        if Reachability.isConnectedToNetwork() == true || Reachability.isConnectedToNetwork() == false {
            self.arrEventData.removeAll()
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Task Name", imageType: .TextOnly, cellType: .Normal, cellTagValue: 0, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Assigned date", imageType: .Calendar, cellType: .Normal, cellTagValue: 1, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Due date", imageType: .Calendar, cellType: .Normal, cellTagValue: 2, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Job Type", cellPlaceHolder: "Job Type", imageType: .DropDown, cellType: .Title, cellTagValue: 3, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Company", cellPlaceHolder: "Company", imageType: .DropDown, cellType: .Title, cellTagValue: 4, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Template", cellPlaceHolder: "Template", imageType: .DropDown, cellType: .Title, cellTagValue: 5, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Priority", cellPlaceHolder: "Priority", imageType: .DropDown, cellType: .Title, cellTagValue: 6, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Comments", imageType: .none, cellType: .Comments, cellTagValue: 7, cellValue: ""))
            self.tblAddEventList?.reloadData()
            
        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

extension SEAddEventViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldBeginEditing(_textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField.tag == 1 || textField.tag == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                textField.resignFirstResponder()
                self.showDateValue(txtField: textField)
            }
        }else if textField.tag == 3 {
            self.showPickerValue(txtField: textField)
        }
        else if textField.tag == 4 {
            self.showPickerValue(txtField: textField)
        }else if textField.tag == 5 {
            self.showPickerValue(txtField: textField)
        }else if textField.tag == 6 {
            self.showPickerValue(txtField: textField)
        }else {
            
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
 
        if textField.tag == 0 {
            self.arrEventData[textField.tag].cellValue = textField.text ?? ""
        }else if textField.tag == 1 {
            self.arrEventData[textField.tag].cellValue = textField.text ?? ""
        }else if textField.tag == 2 {
            self.arrEventData[textField.tag].cellValue = textField.text ?? ""
        }else if textField.tag == 3 {
             textField.text = self.arrEventData[textField.tag].cellValue
        }else if textField.tag == 4 {
            textField.text = self.arrEventData[textField.tag].cellValue
        }else if textField.tag == 5 {
            textField.text = self.arrEventData[textField.tag].cellValue
        }else if textField.tag == 6 {
            textField.text = self.arrEventData[textField.tag].cellValue
        }else if textField.tag == 7 {
            self.arrEventData[textField.tag].cellValue = textField.text ?? ""
        }
        self.tblAddEventList?.reloadData()
    }
    
    
    func textFieldDidBeginEditing(_textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 7 {
            self.arrEventData[textView.tag].cellValue = textView.text ?? ""
        }
    }
    
    func showDateValue(txtField:UITextField)  {
        let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
        let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
        let today = Date()
        // Create picker object
        let datePicker = DatePicker()
        // Setup
        datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
            if selected, let selectedDate = date {
                self.arrEventData[txtField.tag].cellValue = selectedDate.stringTo()
                self.tblAddEventList?.reloadData()
            } else {
                print("Cancelled")
            }
        }
        datePicker.show(in: self, on: txtField)
    }
    
    func showPickerValue(txtField:UITextField)  {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        txtField.inputView = pickerView
        self.selectedTag = txtField.tag
    }
}

extension SEAddEventViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.selectedTag == 3 {
            return self.arrJobType.count
        }else if self.selectedTag == 4 {
            return self.companyBaseList?.result?.count ?? 0
        }else if self.selectedTag == 5 {
            return self.templateList?.result?.count ?? 0
        }
        else if self.selectedTag == 6 {
            return self.arrPriority.count
        }
        return self.salutations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.selectedTag == 3 {
            return self.arrJobType[row]
        }else if self.selectedTag == 4 {
            return self.companyBaseList?.result?[row].com_name
        }else if self.selectedTag == 5 {
            return self.templateList?.result?[row].template_name
        }else if self.selectedTag == 6 {
            return self.arrPriority[row]
        }else {
            return self.salutations[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.selectedTag == 3 {
            if self.arrJobType[row].lowercased() == "internal" {
                self.selectedJobType = "1"
            }else {
                self.selectedJobType = "2"
            }
            self.arrEventData[self.selectedTag].cellValue = self.arrJobType[row]
        }else if self.selectedTag == 4 {
            self.arrEventData[self.selectedTag].cellValue = self.companyBaseList?.result?[row].com_name
            self.selectedCompanyID = self.companyBaseList?.result?[row].com_id ?? ""
        }else if self.selectedTag == 5 {
            self.arrEventData[self.selectedTag].cellValue = self.templateList?.result?[row].template_name
            self.selectedTemplateID = self.templateList?.result?[row].template_id ?? ""
        }else if self.selectedTag == 6 {
            self.arrEventData[self.selectedTag].cellValue = self.arrPriority[row]
            if self.arrPriority[row].lowercased() == "low" {
                self.selectedPriorityID = "1"
            }else if self.arrPriority[row].lowercased() == "medium" {
                self.selectedPriorityID = "2"
            }else {
                self.selectedPriorityID = "3"
            }
        }else {
            self.arrEventData[self.selectedTag].cellValue = self.salutations[row]
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
extension SEAddEventViewController {
    
    @objc func btnSelectionTapped(sender: UIButton) {
        if let countValue = self.teamList?.result?.count {
            for i in (0..<countValue) {
              self.teamList?.result?[i].isSelected = false
            }
        }
        self.teamList?.result?[sender.tag - 100].isSelected = true
        self.selectedTeamID = self.teamList?.result?[sender.tag - 100].team_id ?? ""
        self.tblAddEventList?.reloadData()
    }

    @objc func btnCreateTaskTapped(sender: UIButton) {
        
        var messgae = ""
        if self.arrEventData[0].cellValue == "" {
            messgae = CONTENT_TASK_NAME
        }else if self.arrEventData[1].cellValue == "" {
            messgae = CONTENT_ASSIGN_DATE
        }else if self.arrEventData[2].cellValue == "" {
            messgae = CONTENT_DUE_DATE
        }
        else if self.arrEventData[3].cellValue == "" {
            messgae = CONTENT_JOB_TYPE
        }else if self.arrEventData[4].cellValue == "" {
            messgae = CONTENT_COMPANY_TYPE
        }else if self.arrEventData[5].cellValue == "" {
            messgae = CONTENT_TEMPLATE_TYPE
        }else if self.arrEventData[6].cellValue == "" {
            messgae = CONTENT_PRIORITY_TYPE
        }else if self.arrEventData[7].cellValue == "" {
            messgae = CONTENT_COMMENTS_TYPE
        }else if self.selectedTeamID == ""{
            messgae = CONTENT_SELECT_TEAM
        }else {
            self.createTaskAPI()
            return
        }
        Helper.shared.showSnackBarAlert(message: messgae, type: .Failure)
    }
    
    
}

extension SEAddEventViewController {
    
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
                            self.tblAddEventList?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.companyBaseList?.message ?? "", type: .Failure)
                        }
                        self.getTemplateList()
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
    
    func getTemplateList()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject]
            print(dictParams)
            print(dictParams)
            HttpManager.sharedInstance.getTemplatesData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.templateList = nil
                        self.templateList = try jsonDecoder.decode(TemplateList.self, from: responseObject as! Data)
                        if self.templateList?.key == "1315" {
                            self.tblAddEventList?.reloadData()
                        }else {
                            Helper.shared.showSnackBarAlert(message: self.companyBaseList?.message ?? "", type: .Failure)
                        }
                        self.getTeamList()
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
    
    func getTeamList()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject]
            print(dictParams)
            print(dictParams)
            HttpManager.sharedInstance.getTeamListData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.teamList = nil
                        self.teamList = try jsonDecoder.decode(TeamList.self, from: responseObject as! Data)
                        if self.teamList?.key == "1311" {
                            self.tblAddEventList?.reloadData()
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
    
    func createTaskAPI()
    {
        if Reachability.isConnectedToNetwork() == true {
            showActivityIndicator(self.view)
            var dictParams = [String : Any]()
            dictParams =  ["firm_id" : Session.sharedInstance.getfirm_keyToken() as AnyObject,
                           "job_type" : self.selectedJobType as AnyObject,
                           "task_title" : self.arrEventData[0].cellValue ?? "" as AnyObject,
                            "company" : self.selectedCompanyID as AnyObject,
                            "team" : self.selectedTeamID as AnyObject,
                            "template" : self.selectedTemplateID as AnyObject,
                            "supervisor" : "1" as AnyObject,
                            "from_date" : self.arrEventData[1].cellValue ?? "" as AnyObject,
                            "due_date" : self.arrEventData[2].cellValue ?? "" as AnyObject,
                            "priority" : self.selectedPriorityID as AnyObject,
                            "comments" : self.arrEventData[7].cellValue as AnyObject]
            print(dictParams)
            HttpManager.sharedInstance.createTaskData(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    do {
                        let jsonDecoder = JSONDecoder()
                        self.companyBaseList = nil
                        self.companyBaseList = try jsonDecoder.decode(CompanyBaseList.self, from: responseObject as! Data)
                        if self.companyBaseList?.key == "1309" {
                            Helper.shared.showSnackBarAlert(message: self.companyBaseList?.message ?? "", type: .Success)
                            self.tabBarController!.selectedIndex = 0
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

extension Date {
    
    public func stringTo() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }
}
