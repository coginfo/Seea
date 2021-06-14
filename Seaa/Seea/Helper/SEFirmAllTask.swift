//
//  SEFirmAllTask.swift
//  Seaa
//
//  Created by user on 5/16/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit


struct SEFirmAllTask : Codable {
    let key : String?
    let result : [SEFirmResult]?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result = "result_array"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result = try values.decodeIfPresent([SEFirmResult].self, forKey: .result)
    }

}

struct SEFirmResult : Codable {
    let task_id : String?
    let task_title : String?
    let due_date : String?
    let priority : String?
    let status : String?
    let ta_employee : String?
    let is_active : String?
    let emp_name : String?

    enum CodingKeys: String, CodingKey {

        case task_id = "task_id"
        case task_title = "task_title"
        case due_date = "due_date"
        case priority = "priority"
        case status = "status"
        case ta_employee = "ta_employee"
        case is_active = "is_active"
        case emp_name = "emp_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        task_id = try values.decodeIfPresent(String.self, forKey: .task_id)
        task_title = try values.decodeIfPresent(String.self, forKey: .task_title)
        due_date = try values.decodeIfPresent(String.self, forKey: .due_date)
        priority = try values.decodeIfPresent(String.self, forKey: .priority)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        ta_employee = try values.decodeIfPresent(String.self, forKey: .ta_employee)
        is_active = try values.decodeIfPresent(String.self, forKey: .is_active)
        emp_name = try values.decodeIfPresent(String.self, forKey: .emp_name)
    }

}
