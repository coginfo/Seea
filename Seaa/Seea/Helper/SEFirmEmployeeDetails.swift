//
//  SEFirmEmployeeDetails.swift
//  Seaa
//
//  Created by user on 5/17/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

struct SEFirmEmployeeDetails : Codable {
    let key : String?
    let result : SEFirmEmployeeDetailsResult?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result = "result"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result = try values.decodeIfPresent(SEFirmEmployeeDetailsResult.self, forKey: .result)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct SEFirmEmployeeDetailsResult : Codable {
    let emp_auto_id : String?
    let emp_name : String?
    let emp_email : String?
    let emp_phone : String?
    let emp_dop : String?
    let employee_id : String?
    let emp_address : String?
    let emp_profilepic : String?
    let emp_status : String?

    enum CodingKeys: String, CodingKey {

        case emp_auto_id = "emp_auto_id"
        case emp_name = "emp_name"
        case emp_email = "emp_email"
        case emp_phone = "emp_phone"
        case emp_dop = "emp_dop"
        case employee_id = "employee_id"
        case emp_address = "emp_address"
        case emp_profilepic = "emp_profilepic"
        case emp_status = "emp_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        emp_auto_id = try values.decodeIfPresent(String.self, forKey: .emp_auto_id)
        emp_name = try values.decodeIfPresent(String.self, forKey: .emp_name)
        emp_email = try values.decodeIfPresent(String.self, forKey: .emp_email)
        emp_phone = try values.decodeIfPresent(String.self, forKey: .emp_phone)
        emp_dop = try values.decodeIfPresent(String.self, forKey: .emp_dop)
        employee_id = try values.decodeIfPresent(String.self, forKey: .employee_id)
        emp_address = try values.decodeIfPresent(String.self, forKey: .emp_address)
        emp_profilepic = try values.decodeIfPresent(String.self, forKey: .emp_profilepic)
        emp_status = try values.decodeIfPresent(String.self, forKey: .emp_status)
    }

}
