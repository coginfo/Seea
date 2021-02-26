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

enum SEAddCellImageType: Int {
    case Calendar
    case DropDown
    case TextOnly
}
enum SEAddCellType: Int {
    case Normal
    case Title
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

public class APPHeadingLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.font = UIFont.setAppFontSemiBold(30)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
    }
}


// App Button Style
public class BtnAppStyle: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        //self.titleLabel?.font = UIFont.setAppFontSemiBold(12)
        self.backgroundColor = UIColor.appThemeColor()
        self.titleLabel?.textColor = UIColor.getAppLightBlackColor()
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize.init(width: 0, height: 5)
    }
}

public class AppCellGrayBackView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.appCellViewBackColor()
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1.0
    }
}

// App Button Style
public class TxtAddEvent: UITextField {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.clear
        self.font = UIFont.setAppFontRegular(12)
        self.textColor = UIColor.appHeadingTextColor()
        self.borderStyle = .none
    }
}
