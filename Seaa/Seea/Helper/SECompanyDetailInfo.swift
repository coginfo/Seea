//
//  SECompanyDetailInfo.swift
//  Seaa
//
//  Created by user on 5/22/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import Foundation

struct SECompanyDetailInfo : Codable {
    let key : String?
    let result_array : [SECompanyDetailInfoResult_array]?
    let message : String?
    
    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result_array = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result_array = try values.decodeIfPresent([SECompanyDetailInfoResult_array].self, forKey: .result_array)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct SECompanyDetailInfoResult_array : Codable {
    let com_id : String?
    let firm_id : String?
    let com_key : String?
    let com_name : String?
    let com_type : String?
    let com_username : String?
    let com_email : String?
    let com_password : String?
    let com_phone : String?
    let com_owner : String?
    let com_address : String?
    let com_pan : String?
    let com_din_exp : String?
    let com_status : String?
    let com_date_added : String?
    let com_date_mod : String?

    enum CodingKeys: String, CodingKey {

        case com_id = "com_id"
        case firm_id = "firm_id"
        case com_key = "com_key"
        case com_name = "com_name"
        case com_type = "com_type"
        case com_username = "com_username"
        case com_email = "com_email"
        case com_password = "com_password"
        case com_phone = "com_phone"
        case com_owner = "com_owner"
        case com_address = "com_address"
        case com_pan = "com_pan"
        case com_din_exp = "com_din_exp"
        case com_status = "com_status"
        case com_date_added = "com_date_added"
        case com_date_mod = "com_date_mod"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        com_id = try values.decodeIfPresent(String.self, forKey: .com_id)
        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
        com_key = try values.decodeIfPresent(String.self, forKey: .com_key)
        com_name = try values.decodeIfPresent(String.self, forKey: .com_name)
        com_type = try values.decodeIfPresent(String.self, forKey: .com_type)
        com_username = try values.decodeIfPresent(String.self, forKey: .com_username)
        com_email = try values.decodeIfPresent(String.self, forKey: .com_email)
        com_password = try values.decodeIfPresent(String.self, forKey: .com_password)
        com_phone = try values.decodeIfPresent(String.self, forKey: .com_phone)
        com_owner = try values.decodeIfPresent(String.self, forKey: .com_owner)
        com_address = try values.decodeIfPresent(String.self, forKey: .com_address)
        com_pan = try values.decodeIfPresent(String.self, forKey: .com_pan)
        com_din_exp = try values.decodeIfPresent(String.self, forKey: .com_din_exp)
        com_status = try values.decodeIfPresent(String.self, forKey: .com_status)
        com_date_added = try values.decodeIfPresent(String.self, forKey: .com_date_added)
        com_date_mod = try values.decodeIfPresent(String.self, forKey: .com_date_mod)
    }

}
