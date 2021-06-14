//
//  SEFirmEmployeeDetails.swift
//  Seaa
//
//  Created by user on 5/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit


//struct SEFirmEmployeeActiveDetails : Codable {
//    
//    let key : String?
//    let result : [FirmEmployeeDetailsResult]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case key = "key"
//        case Result = "result_array"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        key = try values.decodeIfPresent(String.self, forKey: .key)
//        result = try values.decodeIfPresent([FirmEmployeeDetailsResult].self, forKey: .Result)
//    }
//
//}
//
//struct FirmEmployeeDetailsResult : Codable {
//    let act_id : String?
//    let firm_id : String?
//    let act_task_id : String?
//    let act_emp_id : String?
//    let act_task_status : String?
//    let act_task_comment : String?
//    let act_date_added : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case act_id = "act_id"
//        case firm_id = "firm_id"
//        case act_task_id = "act_task_id"
//        case act_emp_id = "act_emp_id"
//        case act_task_status = "act_task_status"
//        case act_task_comment = "act_task_comment"
//        case act_date_added = "act_date_added"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        act_id = try values.decodeIfPresent(String.self, forKey: .act_id)
//        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
//        act_task_id = try values.decodeIfPresent(String.self, forKey: .act_task_id)
//        act_emp_id = try values.decodeIfPresent(String.self, forKey: .act_emp_id)
//        act_task_status = try values.decodeIfPresent(String.self, forKey: .act_task_status)
//        act_task_comment = try values.decodeIfPresent(String.self, forKey: .act_task_comment)
//        act_date_added = try values.decodeIfPresent(String.self, forKey: .act_date_added)
//    }
//
//}
