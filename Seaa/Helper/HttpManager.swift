//  HttpManager.swift
//  Created by CogInfo-Nandakumar on 23/11/17.
//  Copyright © 2017 CogInfo-Nandakumar. All rights reserved.
//

//import UIKit
//import Alamofire
//import SwiftyJSON
//import Kingfisher
//import Alamofire.Swift
//
//class HttpManager: NSObject {
//
//    static let sharedInstance = HttpManager()
//    var isFromGetNewPass = Bool()
//    
//    
//    func getDefaultHeaderDetails() -> [String:String]
//    {
//        //AUTHORIZATION =  Session.sharedInstance.getAccessToken()
//        let headers = ["Authorization":  Session.sharedInstance.getAccessToken()]
//       // print(headers)
//        return headers
//    }
//
//    func loginWithUserEmailData(userData: NSDictionary,
//                             successBlock: @escaping kModelSuccessBlock,
//                             failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
//        urlValue = API_BASE_URL + API_LOGIN_EMAIL as String
//        self.convertDictionaryToJsonString(userDict: userData, url: urlValue)
//        AF.request(urlValue , method: .post, parameters:userData as? [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
//        
//            print(response)
//            switch(response.result) {
//            case .success(_):
//                if response.value != nil{
//                    successBlock(true, "Success",response.value as AnyObject)
//                }
//                break
//            case .failure(let error):
//                failureBlock(error.localizedDescription as String)
//                break
//            }
//        }
//    }
//    
//    func payAPIData(userData: NSDictionary,
//                             successBlock: @escaping kModelSuccessBlock,
//                             failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
//        urlValue = API_BASE_URL + API_PAY_PURCHASE as String
//        self.convertDictionaryToJsonString(userDict: userData, url: urlValue)
//        AF.request(urlValue , method: .post, parameters:userData as? [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
//        
//            print(response)
//            switch(response.result) {
//            case .success(_):
//                if response.value != nil{
//                    successBlock(true, "Success",response.value as AnyObject)
//                }
//                break
//            case .failure(let error):
//                failureBlock(error.localizedDescription as String)
//                break
//            }
//        }
//    }
//    
//    func purchaseConfirmAPIData(userData: NSDictionary,
//                             successBlock: @escaping kModelSuccessBlock,
//                             failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
//        urlValue = API_BASE_URL + API_PAY_PURCHASE_CONFIRM as String
//        self.convertDictionaryToJsonString(userDict: userData, url: urlValue)
//        AF.request(urlValue , method: .post, parameters:userData as? [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
//        
//            print(response)
//            switch(response.result) {
//            case .success(_):
//                if response.value != nil{
//                    successBlock(true, "Success",response.value as AnyObject)
//                }
//                break
//            case .failure(let error):
//                failureBlock(error.localizedDescription as String)
//                break
//            }
//        }
//    }
//    
//    func signUpWithUserEmailData(userData: NSDictionary,
//                             successBlock: @escaping kModelSuccessBlock,
//                             failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
//        urlValue = API_BASE_URL + API_LOGIN_SIGNUP as String
//        self.convertDictionaryToJsonString(userDict: userData, url: urlValue)
//        AF.request(urlValue , method: .post, parameters:userData as? [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
//        
//            print(response)
//            switch(response.result) {
//            case .success(_):
//                if response.value != nil{
//                    successBlock(true, "Success",response.value as AnyObject)
//                }
//                break
//            case .failure(let error):
//                failureBlock(error.localizedDescription as String)
//                break
//            }
//        }
//    }
//    
//    func signUpForgotPasswordData(userData: NSDictionary,
//                             successBlock: @escaping kModelSuccessBlock,
//                             failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
//        urlValue = API_BASE_URL + API_LOGIN_FORGOT as String
//        self.convertDictionaryToJsonString(userDict: userData, url: urlValue)
//        AF.request(urlValue , method: .post, parameters:userData as? [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
//        
//            print(response)
//            switch(response.result) {
//            case .success(_):
//                if response.value != nil{
//                    successBlock(true, "Success",response.value as AnyObject)
//                }
//                break
//            case .failure(let error):
//                failureBlock(error.localizedDescription as String)
//                break
//            }
//        }
//    }
//    
//    func getBookListData(userData: NSDictionary,
//                                successBlock: @escaping kModelSuccessBlock,
//                                failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
//        urlValue = API_BASE_URL + API_BOOK_LIST as String
//        self.convertDictionaryToJsonString(userDict: userData, url: urlValue)
//        AF.request(urlValue , method: .post, parameters:userData as? [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
//            print(response)
//            switch(response.result) {
//            case .success(_):
//                if response.value != nil{
//                    successBlock(true, "Success",response.data as AnyObject)
//                }
//                break
//                
//            case .failure(let error):
//                failureBlock(error.localizedDescription as String)
//                break
//            }
//        }
//    }
//    
//    func getMyBookListData(userData: NSDictionary,
//                                successBlock: @escaping kModelSuccessBlock,
//                                failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
//        urlValue = API_BASE_URL + API_MY_BOOK_LIST as String
//        self.convertDictionaryToJsonString(userDict: userData, url: urlValue)
//        AF.request(urlValue , method: .post, parameters:userData as? [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
//            print(response)
//            switch(response.result) {
//            case .success(_):
//                if response.value != nil{
//                    successBlock(true, "Success",response.data as AnyObject)
//                }
//                break
//                
//            case .failure(let error):
//                failureBlock(error.localizedDescription as String)
//                break
//            }
//        }
//    }
//    
//    func getJSONListData(userData: NSDictionary,
//                                successBlock: @escaping kModelSuccessBlock,
//                                failureBlock : @escaping kModelErrorBlock){
//        var urlValue = String()
////        urlValue = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
////        AF.request(urlValue , method: .post, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response:AFDataResponse<Any>) in
////            print(response)
////            switch(response.result) {
////            case .success(_):
////                if response.value != nil{
////                    successBlock(true, "Success",response.data as AnyObject)
////                }
////                break
////                
////            case .failure(let error):
////                failureBlock(error.localizedDescription as String)
////                break
////            }
////        }
//        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")! //change the url
//
//        //create the session object
//        let session = URLSession.shared
//
//        //now create the URLRequest object using the url object
//        let request = URLRequest(url: url)
//
//        //create dataTask using the session object to send data to the server
//        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//
//            guard error == nil else {
//                print(error)
//                return
//            }
//
//            guard let data = data else {
//                return
//            }
//
//           do {
//              //create json object from data
//              if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                 print(json)
//              }
//           } catch let error {
//             print(error.localizedDescription)
//           }
//        })
//
//        task.resume()
//    }
//    
//    let dropboxHeaderWithContentTypeJSON: HTTPHeaders = [
//    "Authorization": "",
//    "Content-Type" : "application/json"
//    ]
//    
//    func convertDictionaryToJsonString(userDict: NSDictionary?,url:String) {
//        print("***********************?************************")
//        let jsonData = try? JSONSerialization.data(withJSONObject: userDict ?? [], options: [])
//        let jsonString = String(data: jsonData!, encoding: .utf8)
//        print(jsonString ?? "Not parsed")
//        print("***********************?************************")
//        print("URL = " + url)
//        
//    }
//    func urlString(strUrl:String) {
//        print("***********************?************************")
//        print("URL = " + strUrl)
//        print("***********************?************************")
//    }
//}
