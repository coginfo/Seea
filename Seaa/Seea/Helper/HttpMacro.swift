
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


let API_BASE_URL = "http://api.seaa.co.in/seaa-api/mob/fa"  //Live
let API_IMAGE_BASE_URL = "http://theagileexecutionapis.com/aellcstagingapi/"
let API_STRIPE_KEY = "pk_live_OpiGuvkGHwrSWTZmmqXBod8a00yArnFP9x"

let API_LOGIN_SIGNUP = "signup"
let API_LOGIN_EMAIL = "/firmauth/getfirmKey"
let API_PAY_PURCHASE = "purchase"
let API_BOOK_LIST = "getaebooks"
let API_LOGIN_FORGOT = "forgotpassword"
let API_PAY_PURCHASE_CONFIRM = "purchaseconfirmation"
let API_MY_BOOK_LIST = "getmyaebooks"
let API_FIRM_KEY = "/firmauth/getfirmKey"
let API_LOGIN_KEY = "/firmauth/firmlogin"
let API_COMPANY_LIST = "/tasks/getcompanies"
let API_TEMPLATES_LIST = "/tasks/getTemplates"
let API_TEAM_LIST = "/tasks/getTeams"
let API_CREATE_API = "/tasks/addtask"
let API_FIRM_EMPLOYEE_LIST = "/employee/getfirmemployees"
let API_GET_ALL_TASK = "/tasks/getAllTasks"
let API_GET_TASK_DETAILS = "/tasks/getTaskdetail"
let API_GET_FIRM_TEMPLATE_LIST = "/tasks/gettasktemplateSubs"
let API_GET_FIRM_TEMPLATE_LIST_ACTIVITIES = "/tasks/gettasksubactivities"
let API_GET_FIRM_EMPLOYEE_DETAILS = "/employee/getemployeedetail"
let API_GET_FIRM_EMPLOYEE_TASK_LIST = "/employee/getemployeeTasklist"
let API_GET_FIRM_EMPLOYEE_ACTIVITIES = "/employee/getemployeeTaskActivities"

let API_GET_FIRM_COMPANY_LIST = "/tasks/getcompanies"

let API_GET_FIRM_COMPANY_INFO = "/tasks/getcompanyinfo"
let API_GET_FIRM_COMPANY_TASK_LIST = "/tasks/getCompanyTasklist"
//Message

let MSG_FIRM_KEY = "Please Enter Firm Key"
let MSG_LOGIN = "Please Enter UserName and Password"
