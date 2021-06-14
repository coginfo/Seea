//
//  SEFirmTaskDetails.swift
//  Seaa
//
//  Created by user on 5/16/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

struct SEFirmTaskDetails : Codable {
    let key : String?
    let result : [SEFirmTaskDetailsResult]?
    let message : String?
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case result = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent([SEFirmTaskDetailsResult].self, forKey: .result)
    }

}

struct SEFirmTaskDetailsResult : Codable {
    let task_id : String?
    let task_title : String?
    let due_date : String?
    let priority : String?
    let status : String?
    let ta_employee : String?
    let is_active : String?
    let emp_name : String?
    let com_name : String?
    let template : String?
    let team : String?
    let comments : String?

    enum CodingKeys: String, CodingKey {

        case task_id = "task_id"
        case task_title = "task_title"
        case due_date = "due_date"
        case priority = "priority"
        case status = "status"
        case ta_employee = "ta_employee"
        case is_active = "is_active"
        case emp_name = "emp_name"
        case com_name = "com_name"
        case template = "template"
        case team = "team"
        case comments = "comments"
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
        com_name = try values.decodeIfPresent(String.self, forKey: .com_name)
        template = try values.decodeIfPresent(String.self, forKey: .template)
        team = try values.decodeIfPresent(String.self, forKey: .team)
        comments = try values.decodeIfPresent(String.self, forKey: .comments)
    }

}
