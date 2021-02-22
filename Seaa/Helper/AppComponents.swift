//
//  AppComponents.swift
//  AgileApp
//
//  Created by user on 3/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit



enum NavigationButtonType: Int {
    case WithButtons
    case WithBackButton
    case WithOutBackButton
    case WithOutSearchButton
}

enum SEAlertMessageType: Int {
    case Completed
    case InProgress
    case NotCompleted
}

//MARK: <******************UIView - Header******************>


public class AppWhiteCornerBackView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1.0
    }
}


public class AppHomeBtnCornerBackView: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.titleLabel?.textColor = UIColor.white
        self.layer.cornerRadius = 25.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1.0
        self.backgroundColor = UIColor.appThemeColor()
        //self.titleLabel?.font = UIFont.setAppFontSemiBold(12)
    }
}

public class APPMediumLable: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        //self.font = UIFont.setAppFontSemiBold(30)
        self.textColor = UIColor.appThemeColor()
        self.backgroundColor = UIColor.clear
    }
}
