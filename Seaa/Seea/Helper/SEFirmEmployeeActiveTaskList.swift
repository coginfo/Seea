//
//  SEFirmEmployeeActiveTaskList.swift
//  Seaa
//
//  Created by user on 5/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit


struct SEFirmEmployeeActiveTaskList : Codable {
    let key : String?
    let result : [FirmEmployeeActiveTaskListResult]?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result = try values.decodeIfPresent([FirmEmployeeActiveTaskListResult].self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct FirmEmployeeActiveTaskListResult : Codable {
    let task_id : String?
    let emp_id : String?
    let due_date : String?
    let completed_date : String?
    let status : String?
    let task_title : String?

    enum CodingKeys: String, CodingKey {

        case task_id = "task_id"
        case emp_id = "emp_id"
        case due_date = "due_date"
        case completed_date = "completed_date"
        case status = "status"
        case task_title = "task_title"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        task_id = try values.decodeIfPresent(String.self, forKey: .task_id)
        emp_id = try values.decodeIfPresent(String.self, forKey: .emp_id)
        due_date = try values.decodeIfPresent(String.self, forKey: .due_date)
        completed_date = try values.decodeIfPresent(String.self, forKey: .completed_date)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        task_title = try values.decodeIfPresent(String.self, forKey: .task_title)
    }

}

