//
//  FirmEmployeeList.swift
//  Seaa
//
//  Created by user on 5/16/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit


struct FirmEmployeeList : Codable {
    let key : String?
    var result : [FirmEmployeeResult]?
    let message : String?
    
    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result = try values.decodeIfPresent([FirmEmployeeResult].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct Emp_current_task : Codable {
    let ta_due_date : String?
    let task_title : String?

    enum CodingKeys: String, CodingKey {

        case ta_due_date = "ta_due_date"
        case task_title = "task_title"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ta_due_date = try values.decodeIfPresent(String.self, forKey: .ta_due_date)
        task_title = try values.decodeIfPresent(String.self, forKey: .task_title)
    }

}

struct FirmEmployeeResult : Codable {
    let emp_auto_id : String?
    let firm_id : String?
    let emp_key : String?
    let emp_name : String?
    let employee_id : String?
    let emp_status : String?
    let emp_current_task : Emp_current_task?
    let emp_pending_task : Int?
    let emp_completed_task : Int?
    let emp_priority_task : Int?
    public var isSelected : Bool? = false
    
    enum CodingKeys: String, CodingKey {

        case emp_auto_id = "emp_auto_id"
        case firm_id = "firm_id"
        case emp_key = "emp_key"
        case emp_name = "emp_name"
        case employee_id = "employee_id"
        case emp_status = "emp_status"
        case emp_current_task = "emp_current_task"
        case emp_pending_task = "emp_pending_task"
        case emp_completed_task = "emp_completed_task"
        case emp_priority_task = "emp_priority_task"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        emp_auto_id = try values.decodeIfPresent(String.self, forKey: .emp_auto_id)
        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
        emp_key = try values.decodeIfPresent(String.self, forKey: .emp_key)
        emp_name = try values.decodeIfPresent(String.self, forKey: .emp_name)
        employee_id = try values.decodeIfPresent(String.self, forKey: .employee_id)
        emp_status = try values.decodeIfPresent(String.self, forKey: .emp_status)
        emp_current_task = try values.decodeIfPresent(Emp_current_task.self, forKey: .emp_current_task)
        emp_pending_task = try values.decodeIfPresent(Int.self, forKey: .emp_pending_task)
        emp_completed_task = try values.decodeIfPresent(Int.self, forKey: .emp_completed_task)
        emp_priority_task = try values.decodeIfPresent(Int.self, forKey: .emp_priority_task)
    }

}
