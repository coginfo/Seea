/*
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct CompanyBaseList : Codable {
	let key : String?
    let message : String?
    var result : [CompanyListResult]?

	enum CodingKeys: String, CodingKey {

		case key = "key"
		case result = "result_array"
        case message = "message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		key = try values.decodeIfPresent(String.self, forKey: .key)
        message = try values.decodeIfPresent(String.self, forKey: .message)
		result = try values.decodeIfPresent([CompanyListResult].self, forKey: .result)
	}

}

struct CompanyListResult : Codable {
    let com_id : String?
    let firm_id : String?
    let com_name : String?
    let com_type : String?
    let com_email : String?
    let com_phone : String?
    public var isSelected : Bool? = false
    
    enum CodingKeys: String, CodingKey {

        case com_id = "com_id"
        case firm_id = "firm_id"
        case com_name = "com_name"
        case com_type = "com_type"
        case com_email = "com_email"
        case com_phone = "com_phone"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        com_id = try values.decodeIfPresent(String.self, forKey: .com_id)
        firm_id = try values.decodeIfPresent(String.self, forKey: .firm_id)
        com_name = try values.decodeIfPresent(String.self, forKey: .com_name)
        com_type = try values.decodeIfPresent(String.self, forKey: .com_type)
        com_email = try values.decodeIfPresent(String.self, forKey: .com_email)
        com_phone = try values.decodeIfPresent(String.self, forKey: .com_phone)
    }

}

//https://app.quicktype.io
//https://www.json4swift.com/results.php
//https://www.json4swift.com/converter/jsongen.php


