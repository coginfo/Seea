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
    let salutations = ["", "Mr.", "Ms.", "Mrs."]
    var selectedTag:Int = 0
    
    @IBOutlet weak var tblAddEventList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tblAddEventList?.delegate = self
        self.tblAddEventList?.dataSource = self
        self.tblAddEventList?.backgroundColor = UIColor.clear
        self.tblAddEventList.register(UINib(nibName: "SEAddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "SEAddEventTableViewCell")
        self.tblAddEventList.register(UINib(nibName: "SETitleAddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "SETitleAddEventTableViewCell")
        self.tblAddEventList.rowHeight = UITableView.automaticDimension
        self.tblAddEventList.estimatedRowHeight = 300
        self.tblAddEventList.separatorColor = UIColor.clear
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.getAddTaskList()
    }
    
}

extension SEAddEventViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEventData.count
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.arrEventData[indexPath.row].cellType == .Normal{
            let cellValue:SEAddEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SEAddEventTableViewCell", for: indexPath) as! SEAddEventTableViewCell
            cellValue.txtAddEvent?.placeholder = self.arrEventData[indexPath.row].cellPlaceHolder
            cellValue.txtAddEvent?.tag = self.arrEventData[indexPath.row].cellTagValue ?? 0
            
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
            cellValue.selectionStyle = .none
            return cellValue
        }else {
            let cellValue1:SETitleAddEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SETitleAddEventTableViewCell", for: indexPath) as! SETitleAddEventTableViewCell
            
            cellValue1.lblTitleAddEvent?.text = self.arrEventData[indexPath.row].cellTitle
            cellValue1.selectionStyle = .none
            cellValue1.txtTitleAddEvent?.delegate = self
            cellValue1.txtTitleAddEvent?.text = self.arrEventData[indexPath.row].cellValue
            return cellValue1
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //self.moveScrumMasterView(tagValue: indexPath.row)
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
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Job Type", imageType: .DropDown, cellType: .Normal, cellTagValue: 3, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Company", cellPlaceHolder: "", imageType: .DropDown, cellType: .Title, cellTagValue: 4, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "", cellPlaceHolder: "Task Name", imageType: .TextOnly, cellType: .Normal, cellTagValue: 5, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Template", cellPlaceHolder: "", imageType: .DropDown, cellType: .Title, cellTagValue: 6, cellValue: ""))
            self.arrEventData.append(AddEventCellType.init(cellTitle: "Priority", cellPlaceHolder: "", imageType: .DropDown, cellType: .Title, cellTagValue: 7, cellValue: ""))
            self.tblAddEventList?.reloadData()
            
        }
        else{
            self.showAlertView(message: NETWORK_CONNECTION, controller: self)
        }
    }
}

extension SEAddEventViewController: UITextFieldDelegate {
    
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
        }else {
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.tblAddEventList?.reloadData()
    }
    
    
    
    func textFieldDidBeginEditing(_textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
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
                self.arrEventData[txtField.tag].cellValue = selectedDate.string()
                print(txtField.tag)
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
        return self.salutations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.salutations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.arrEventData[self.selectedTag].cellValue = self.salutations[row]
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
