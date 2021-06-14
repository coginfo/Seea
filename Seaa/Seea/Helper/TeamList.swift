//
//  TeamList.swift
//  Seaa
//
//  Created by user on 5/14/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import Foundation

struct TeamList : Codable {
    let key : String?
    let message : String?
    var result : [TeamResult]?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case result = "result_array"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent([TeamResult].self, forKey: .result)
    }

}

struct TeamResult : Codable {
        let team_id : String?
        let team_name : String?
        let work_nature : String?
        let team_status : String?
        let team_lead : String?
        let team_lead_name : String?
        let member_count : Int?
        public var isSelected : Bool? = false

        enum CodingKeys: String, CodingKey {

            case team_id = "team_id"
            case team_name = "team_name"
            case work_nature = "work_nature"
            case team_status = "team_status"
            case team_lead = "team_lead"
            case team_lead_name = "team_lead_name"
            case member_count = "member_count"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            team_id = try values.decodeIfPresent(String.self, forKey: .team_id)
            team_name = try values.decodeIfPresent(String.self, forKey: .team_name)
            work_nature = try values.decodeIfPresent(String.self, forKey: .work_nature)
            team_status = try values.decodeIfPresent(String.self, forKey: .team_status)
            team_lead = try values.decodeIfPresent(String.self, forKey: .team_lead)
            team_lead_name = try values.decodeIfPresent(String.self, forKey: .team_lead_name)
            member_count = try values.decodeIfPresent(Int.self, forKey: .member_count)
        }

    }
