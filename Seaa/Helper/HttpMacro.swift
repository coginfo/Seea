
//  HttpMacro.swift
//  Created by CogInfo-Nandakumar on 08/11/17.
//  Copyright © 2017 CogInfo-Nandakumar. All rights reserved.
//

import Foundation
import UIKit

typealias kSuccessBlock = (_ success : Bool, _ message : String) ->()
typealias kErrorBlock = (_ errorMesssage: String) -> ()



typealias kModelSuccessBlock = (_ success : Bool, _ message : String, _ responseObject:AnyObject) ->()
typealias kModelErrorBlock = (_ errorMesssage: String) -> ()


/// Base Url
//let API_BASE_URL = "http://theagileexecutionapis.com/aellcapis/"  //Live
//let API_IMAGE_BASE_URL = "http://theagileexecutionapis.com/aellcstagingapi/"
//let API_STRIPE_KEY = "pk_test_9f0YNSQLF7opVNUphCyxktPZ00Ztbzrtyy"


let API_BASE_URL = "http://theagileexecutionapis.com/aellcstagingapi/"  //Live
let API_IMAGE_BASE_URL = "http://theagileexecutionapis.com/aellcstagingapi/"
let API_STRIPE_KEY = "pk_live_OpiGuvkGHwrSWTZmmqXBod8a00yArnFP9x"

let API_LOGIN_SIGNUP = "signup"
let API_LOGIN_EMAIL = "login"
let API_PAY_PURCHASE = "purchase"
let API_BOOK_LIST = "getaebooks"
let API_LOGIN_FORGOT = "forgotpassword"
let API_PAY_PURCHASE_CONFIRM = "purchaseconfirmation"
let API_MY_BOOK_LIST = "getmyaebooks"

