//
//  SEFirmLoginViewController.swift
//  Seaa
//
//  Created by user on 2/22/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
import SwiftyJSON

class SEFirmLoginViewController: UIViewController {
    
    @IBOutlet weak var txtFirmName: ACFloatingTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtFirmName?.delegate = self
    }
    
}

extension SEFirmLoginViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let stringVal = NSString(string: textField.text!)
        let newText = stringVal.replacingCharacters(in: range, with: string)
        
        if textField == self.txtFirmName {
            return !(newText.count > 16)
        }
        
        return true
    }
}

extension SEFirmLoginViewController {
    
    @IBAction func btnFirmLoginTapped(_ sender: Any) {
        self.txtFirmName?.text = "drole1815"
        if self.txtFirmName?.text?.count != 0{
            self.callFirmAPI()
            //self.moveToSign()
        }else {
           Helper.shared.showSnackBarAlert(message: MSG_FIRM_KEY, type: .Failure)
        }
    }
    
    func callFirmAPI(){ //newGood
        self.view.endEditing(true)
        self.showActivityIndicator(self.view)
        if Reachability.isConnectedToNetwork() == true {
            var dictParams = [String : Any]()
            dictParams =  ["firm_id" : self.removeWhiteSpace(text: self.txtFirmName?.text ?? "") as AnyObject]
            print(dictParams)
            HttpManager.sharedInstance.loginWithFirm(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    print(responseObject)
                    let data : JSON = JSON(responseObject as AnyObject)
                    if data["key"].stringValue == "1101" {
                        self.moveToSign()
                        Session.sharedInstance.setfirm_keyToken(data["result"]["refKey"].stringValue)
                    }else {
                        Helper.shared.showSnackBarAlert(message: data["message"].stringValue, type: .Failure)
                    }
                }
                }, failureBlock: {[unowned self] (errorMesssage) in
                    self.hideActivityIndicator(self.view)
                    Helper.shared.showSnackBarAlert(message: errorMesssage.description, type: .Failure)
            });
        }else {
            self.hideActivityIndicator(self.view)
            Helper.shared.showSnackBarAlert(message: NETWORK_CONNECTION, type: .Failure)
        }
    }
    
    func moveToSign() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SELoginViewController") as! SELoginViewController
        self.navigationController?.pushViewController(initial, animated: true)
    }
}

