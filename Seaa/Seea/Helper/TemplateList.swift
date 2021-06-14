//
//  TemplateList.swift
//  Seaa
//
//  Created by user on 5/14/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import Foundation

struct TemplateList : Codable {
    let key : String?
    let message : String?
    let result : [TemplateResult]?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent([TemplateResult].self, forKey: .result)
    }

}

struct TemplateResult : Codable {
    let template_id : String?
    let firm_id : String?
    let template_name : String?
    let template_status : String?
    let template_added : String?

    enum CodingKeys: String, CodingKey {

        case template_id = "template_id"
        case firm_id = "firm_id"
        case template_name = "template_name"
        case template_status = "template_status"
        case template_added = "template_added"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        template_id = try values.decodeIfPresent(String.self, forKey: .template_id)
        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
        template_name = try values.decodeIfPresent(String.self, forKey: .template_name)
        template_status = try values.decodeIfPresent(String.self, forKey: .template_status)
        template_added = try values.decodeIfPresent(String.self, forKey: .template_added)
    }

}
