//
//  SEFirmTemplateList.swift
//  Seaa
//
//  Created by user on 5/16/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

struct SEFirmTemplateList : Codable {
    let key : String?
    let result : [FirmTemplateListResult]?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result = "result_array"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result = try values.decodeIfPresent([FirmTemplateListResult].self, forKey: .result)
    }

}

struct FirmTemplateListResult : Codable {
    let tmp_task_id : String?
    let firm_id : String?
    let tmp_id : String?
    let tmp_task_name : String?
    let tmp_task_order : String?
    let tem_act_status : Tem_act_status?

    enum CodingKeys: String, CodingKey {

//        case tmp_task_id = "tmp_task_id"
//        case firm_id = "firm_id"
//        case tmp_id = "tmp_id"
//        case tmp_task_name = "tmp_task_name"
//        case tmp_task_order = "tmp_task_order"
//        case tem_act_status = "tem_act_status"
        
        
        case tmp_task_id = "tmp_act_id"
        case firm_id = "firm_id"
        case tmp_id = "tmp_id"
        case tmp_task_name = "tmp_act_name"
        case tmp_task_order = "tmp_act_order"
        case tem_act_status = "tem_act_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tmp_task_id = try values.decodeIfPresent(String.self, forKey: .tmp_task_id)
        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
        tmp_id = try values.decodeIfPresent(String.self, forKey: .tmp_id)
        tmp_task_name = try values.decodeIfPresent(String.self, forKey: .tmp_task_name)
        tmp_task_order = try values.decodeIfPresent(String.self, forKey: .tmp_task_order)
        tem_act_status = try values.decodeIfPresent(Tem_act_status.self, forKey: .tem_act_status)
    }

}

struct Tem_act_status : Codable {
    let act_id : String?
    let act_task_status : String?
    let act_date_added : String?

    enum CodingKeys: String, CodingKey {

        case act_id = "act_id"
        case act_task_status = "act_task_status"
        case act_date_added = "act_date_added"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        act_id = try values.decodeIfPresent(String.self, forKey: .act_id)
        act_task_status = try values.decodeIfPresent(String.self, forKey: .act_task_status)
        act_date_added = try values.decodeIfPresent(String.self, forKey: .act_date_added)
    }

}
