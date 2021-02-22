//
//  SEFirmLoginViewController.swift
//  Seaa
//
//  Created by user on 2/22/21.
//  Copyright © 2021 CogInfo. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift

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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateViewController(withIdentifier: "SELoginViewController") as! SELoginViewController
        self.navigationController?.pushViewController(initial, animated: true)
    }
}

