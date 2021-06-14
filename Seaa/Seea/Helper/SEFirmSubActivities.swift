//
//  SEFirmSubActivities.swift
//  Seaa
//
//  Created by user on 5/16/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit

struct SEFirmSubActivities : Codable {
    let key : String?
    let result_array : [Result_array]?
    let message : String?
    
    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result_array = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        result_array = try values.decodeIfPresent([Result_array].self, forKey: .result_array)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct Result_array : Codable {
    let sub_act_id : String?
    let firm_id : String?
    let task_act_id : String?
    let sa_task_id : String?
    let sa_tem_id : String?
    let sa_temact_id : String?
    let sa_emp_id : String?
    let sa_comment : String?
    let sa_act_date : String?
    let sub_files : [Sub_files]?
    let com_activities : [String]?

    enum CodingKeys: String, CodingKey {

        case sub_act_id = "sub_act_id"
        case firm_id = "firm_id"
        case task_act_id = "task_act_id"
        case sa_task_id = "sa_task_id"
        case sa_tem_id = "sa_tem_id"
        case sa_temact_id = "sa_temact_id"
        case sa_emp_id = "sa_emp_id"
        case sa_comment = "sa_comment"
        case sa_act_date = "sa_act_date"
        case sub_files = "sub_files"
        case com_activities = "com_activities"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sub_act_id = try values.decodeIfPresent(String.self, forKey: .sub_act_id)
        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
        task_act_id = try values.decodeIfPresent(String.self, forKey: .task_act_id)
        sa_task_id = try values.decodeIfPresent(String.self, forKey: .sa_task_id)
        sa_tem_id = try values.decodeIfPresent(String.self, forKey: .sa_tem_id)
        sa_temact_id = try values.decodeIfPresent(String.self, forKey: .sa_temact_id)
        sa_emp_id = try values.decodeIfPresent(String.self, forKey: .sa_emp_id)
        sa_comment = try values.decodeIfPresent(String.self, forKey: .sa_comment)
        sa_act_date = try values.decodeIfPresent(String.self, forKey: .sa_act_date)
        sub_files = try values.decodeIfPresent([Sub_files].self, forKey: .sub_files)
        com_activities = try values.decodeIfPresent([String].self, forKey: .com_activities)
    }

}
struct Sub_files : Codable {
    let sf_id : String?
    let task_act_id : String?
    let sf_file_discription : String?
    let sf_file_tags : String?
    let sf_filename : String?
    let sub_act_id : String?
    let sf_date_added : String?

    enum CodingKeys: String, CodingKey {

        case sf_id = "sf_id"
        case task_act_id = "task_act_id"
        case sf_file_discription = "sf_file_discription"
        case sf_file_tags = "sf_file_tags"
        case sf_filename = "sf_filename"
        case sub_act_id = "sub_act_id"
        case sf_date_added = "sf_date_added"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sf_id = try values.decodeIfPresent(String.self, forKey: .sf_id)
        task_act_id = try values.decodeIfPresent(String.self, forKey: .task_act_id)
        sf_file_discription = try values.decodeIfPresent(String.self, forKey: .sf_file_discription)
        sf_file_tags = try values.decodeIfPresent(String.self, forKey: .sf_file_tags)
        sf_filename = try values.decodeIfPresent(String.self, forKey: .sf_filename)
        sub_act_id = try values.decodeIfPresent(String.self, forKey: .sub_act_id)
        sf_date_added = try values.decodeIfPresent(String.self, forKey: .sf_date_added)
    }

}
