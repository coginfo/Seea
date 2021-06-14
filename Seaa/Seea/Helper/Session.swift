//
//  Session.swift
//  
//
//  Created by CogInfo-Nandakumar on 23/11/17.
//  Copyright © 2017 CogInfo-Nandakumar. All rights reserved.
//

import UIKit

public class Session: NSObject {
    var userDefaults :UserDefaults
    
    class var sharedInstance: Session {
        struct Static {
            static let instance = Session()
        }
        return Static.instance
    }
    
    override init() {
        self.userDefaults = UserDefaults()
    }
    
    func removeAllInstance()  {
            let defaults = userDefaults
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                print(key)
                if key == "deviceID" || key == "saltKey" || key == "isAppFirst"{
                    
                }else {
                    defaults.removeObject(forKey: key)
                }
            }
    }
    
    func saveValue() {
        self.userDefaults.synchronize()
    }
    
    
    func setAccessToken (_ value: String) {
        
        self.userDefaults.set(value, forKey: "AccessToken")
        self.saveValue()
    }
    
    func getAccessToken ()-> String {
        let value: String? = self.userDefaults.object(forKey: "AccessToken") as? String
        return value ?? ""
    }
    
    func setUserID (_ value: String) {
        
        self.userDefaults.set(value, forKey: "UserID")
        self.saveValue()
    }
    
    func getUserID ()-> String {
        let value: String? = self.userDefaults.object(forKey: "UserID") as? String
        return value ?? ""
    }
    
    func setTempPass (_ value: String) {
        
        self.userDefaults.set(value, forKey: "Password")
        self.saveValue()
    }
    func getTempPass ()-> String {
        let value: String? = self.userDefaults.object(forKey: "Password") as? String
        return value ?? ""
    }
    
    func setUserId (_ value: String) {
        
        self.userDefaults.set(value, forKey: "UserId")
        self.saveValue()
    }
    func getUserId ()-> String {
        let value = self.userDefaults.object(forKey: "UserId") as? String
        return value ?? ""
    }
    
    func setUserMAILD (_ value: String) {
        
        self.userDefaults.set(value, forKey: "MailID")
        self.saveValue()
    }
    func getUserMAILD ()-> String {
        let value = self.userDefaults.object(forKey: "MailID") as? String
        return value ?? ""
    }
    
    func setUserProfileImage (_ value: String) {
        
        self.userDefaults.set(value, forKey: "UserProfileImage")
        self.saveValue()
    }
    func getUserProfileImage ()-> String {
        let value = self.userDefaults.object(forKey: "UserProfileImage") as? String
        return value ?? ""
    }
    
    
    func setUserName (_ value: String) {
        
        self.userDefaults.set(value, forKey: "UserName")
        self.saveValue()
    }
    func getUserName ()-> String {
        let value = self.userDefaults.object(forKey: "UserName") as? String
        return value ?? ""
    }
    
    //Bool
    func setIsUserLogin(userLoginStatus: Bool) {
        self.userDefaults.set(userLoginStatus, forKey: "isUserLogin")
        self.saveValue()
    }
    
    func getIsUserLogin() -> Bool {
        return self.userDefaults.bool(forKey: "isUserLogin")
    }
    
    func setIsUserLoginWithTempPass(userLoginTemp: Bool) {
        self.userDefaults.set(userLoginTemp, forKey: "isTempPass")
        self.saveValue()
    }
    
    func getIsUserLoginWithTempPass() -> Bool {
        return self.userDefaults.bool(forKey: "isTempPass")
    }
    
   
    /// Save login baseclass for accounts
    ///
    /// - Parameter value: login response
    func setLoginBaseClass (_ value: String) {
        
        self.userDefaults.set(value, forKey: "LoginValue")
        self.saveValue()
    }
    
     func getLoginBaseClass ()-> String {
        let value = self.userDefaults.object(forKey: "LoginValue") as? String
        return value ?? ""
    }
    
    
    
    //Broject Setup//
    //Bool
    func setIsFirst(status: Bool) {
        self.userDefaults.set(status, forKey: "isAppFirst")
        self.saveValue()
    }
    
    func getIsFirst() -> Bool {
        return self.userDefaults.bool(forKey: "isAppFirst")
    }
   
    func setUniqueDeviceID () {
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        self.userDefaults.set(deviceID, forKey: "deviceID")
        self.saveValue()
    }
    
    func getUniqueDeviceID ()-> String {
        let value = self.userDefaults.object(forKey: "deviceID") as? String
        return value ?? ""
    }

   
    
    func setLoginToken (token: String) {
        self.userDefaults.set(token, forKey: "LoginToken")
        self.saveValue()
    }
    
    func getLoginToken ()-> String {
        let value = self.userDefaults.object(forKey: "LoginToken") as? String
        return value ?? ""
    }
    
    
    func setHotspotName(hotspotName: String) {
        self.userDefaults.set(hotspotName, forKey: "HotspotName")
        self.saveValue()
    }
    
    func getHotspotName ()-> String {
        let value = self.userDefaults.object(forKey: "HotspotName") as? String
        return value ?? ""
    }
    
    func setHotspotPassword (hotspotPassword: String) {
        self.userDefaults.set(hotspotPassword, forKey: "HotspotPassword")
        self.saveValue()
    }
    
    func getHotspotPassword ()-> String {
        let value = self.userDefaults.object(forKey: "HotspotPassword") as? String
        return value ?? ""
    }
    
    func setLockCode(lockCode: String) {
        self.userDefaults.set(lockCode, forKey: "HotspotPassword")
        self.saveValue()
    }
    
    func getLockCode ()-> String {
        let value = self.userDefaults.object(forKey: "HotspotPassword") as? String
        return value ?? ""
    }
    
    func setIsTouchID(isTouchID: Bool) {
        self.userDefaults.set(isTouchID, forKey: "isTouchID")
        self.saveValue()
    }
    
    func getIsTouchID() -> Bool {
        return self.userDefaults.bool(forKey: "isTouchID")
    }
    
    func setIsLoginUserName (value: String) {
        self.userDefaults.set(value, forKey: "loginUserName")
        self.saveValue()
    }
    
    func getIsLoginUserName ()-> String {
        let value = self.userDefaults.object(forKey: "loginUserName") as? String
        return value ?? ""
    }
    
    
    func setIsLoginPassword (value: String) {
        self.userDefaults.set(value, forKey: "loginPassword")
        self.saveValue()
    }
    
    func getIsLoginPassword ()-> String {
        let value = self.userDefaults.object(forKey: "loginPassword") as? String
        return value ?? ""
    }
    
    func setIsDeviceTouchID(isTouchID: Bool) {
        self.userDefaults.set(isTouchID, forKey: "isDeviceTouchID")
        self.saveValue()
    }
    
    func getIsDeviceTouchID() -> Bool {
        return self.userDefaults.bool(forKey: "isDeviceTouchID")
    }
    
    func setfirm_keyToken (_ value: String) {
        
        self.userDefaults.set(value, forKey: "firm_key")
        self.saveValue()
    }
    
    func getfirm_keyToken ()-> String {
        let value: String? = self.userDefaults.object(forKey: "firm_key") as? String
        return value ?? ""
    }
    
    
}


