//
//  SELoginViewController.swift
//  Seaa
//
//  Created by user on 2/22/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
import SwiftyJSON

class SELoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: ACFloatingTextfield!
    @IBOutlet weak var txtPassword: ACFloatingTextfield!

    @IBOutlet weak var btnEmployeeCheckBox: UIButton!
    @IBOutlet weak var btnEmployee: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtUsername?.delegate = self
        self.txtPassword?.delegate = self
    }
}

extension SELoginViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let stringVal = NSString(string: textField.text!)
        let newText = stringVal.replacingCharacters(in: range, with: string)
        
        if textField == self.txtUsername {
            return !(newText.count > 16)
        }
        if textField == self.txtPassword {
            return !(newText.count > 16)
        }
        return true
    }
}

extension SELoginViewController {
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        self.txtUsername?.text = "drole1815"
        self.txtPassword?.text = "admin"
        if self.txtUsername?.text?.count != 0 && self.txtPassword?.text?.count != 0 {
            self.callSignAPI()
            //self.moveToDashBoard()
        }else {
           Helper.shared.showSnackBarAlert(message: MSG_LOGIN, type: .Failure)
        }
    }
    func moveToDashBoard()  {
        let viewController = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil).instantiateViewController(withIdentifier: "SETabbarViewController") as! SETabbarViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func callSignAPI(){ //newGood
        self.view.endEditing(true)
        self.showActivityIndicator(self.view)
        if Reachability.isConnectedToNetwork() == true {
            var dictParams = [String : Any]()
            dictParams = ["firm_key" : Session.sharedInstance.getfirm_keyToken() as AnyObject,"username" : self.removeWhiteSpace(text: self.txtUsername?.text ?? "") as AnyObject,"password" : self.removeWhiteSpace(text: self.txtPassword?.text ?? "") as AnyObject]
            print(dictParams)
            HttpManager.sharedInstance.loginWithUserPass(userData: dictParams as NSDictionary , successBlock: {[unowned self] (success, message, responseObject) in
                self.hideActivityIndicator(self.view)
                if success {
                    print(responseObject)
                    let data : JSON = JSON(responseObject as AnyObject)
                    if data["key"].stringValue == "1103" {
                        Helper.shared.showSnackBarAlert(message: data["message"].stringValue, type: .Success)
                        self.moveToDashBoard()
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
}
