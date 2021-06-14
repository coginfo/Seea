//
//  SECompanyInfoTaskList.swift
//  Seaa
//
//  Created by user on 5/22/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import Foundation

struct SECompanyInfoTaskList : Codable {
    let key : String?
    let result_array : [SECompanyInfoTaskListArray]?
    let message : String?
    
    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result_array = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result_array = try values.decodeIfPresent([SECompanyInfoTaskListArray].self, forKey: .result_array)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct SECompanyInfoTaskListArray : Codable {
    let task_id : String?
    let firm_id : String?
    let task_title : String?
    let due_date : String?
    let company : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case task_id = "task_id"
        case firm_id = "firm_id"
        case task_title = "task_title"
        case due_date = "due_date"
        case company = "company"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        task_id = try values.decodeIfPresent(String.self, forKey: .task_id)
        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
        task_title = try values.decodeIfPresent(String.self, forKey: .task_title)
        due_date = try values.decodeIfPresent(String.self, forKey: .due_date)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}
