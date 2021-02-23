//
//  SELoginViewController.swift
//  Seaa
//
//  Created by user on 2/22/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift

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
        let viewController = UIStoryboard(name: MAIN_STORY_BOARD, bundle: nil).instantiateViewController(withIdentifier: "SETabbarViewController") as! SETabbarViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
