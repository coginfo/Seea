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
    case Comments
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
        self.titleLabel?.font = UIFont.setAppFontSemiBold(16)
        self.backgroundColor = UIColor.appThemeColor()
        self.titleLabel?.textColor = UIColor.getAppLightBlackColor()
        self.layer.cornerRadius = 12.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize.init(width: 0, height: 5)
    }
}

public class BtnNormalAppStyle: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.titleLabel?.font = UIFont.setAppFontMedium(14)
        self.backgroundColor = UIColor.clear
        self.titleLabel?.textColor = UIColor.getAppLightBlackColor()
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
        self.backgroundColor = UIColor.appCellViewBgColor()
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1.0
    }
}

public class AppCellSelectionBackView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 12.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
    }
}

public class AppCellEmployeeListBackView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.appCellEmployeeViewBgColor()
        self.layer.cornerRadius = 12.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
    }
}

public class AppDateBackView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 12.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
    }
}


public class BtnSelectionNo: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.titleLabel?.font = UIFont.setAppFontSemiBold(12)
        self.titleLabel?.textColor = UIColor.white
        self.backgroundColor = UIColor.appThemeColor()
        self.layer.cornerRadius = self.frame.width/2.0
    }
}

public class BtnEmployeeShort: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.titleLabel?.font = UIFont.setAppFontSemiBold(12)
        self.titleLabel?.textColor = UIColor.white
        self.backgroundColor = UIColor.appThemeColor()
        self.layer.cornerRadius = 4.0
    }
}

public class BtnSelectionOption: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.clear
    }
}

public class AppCellEmployeeDetailsBackView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor(red: 234.0/255.0, green: 236.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        self.layer.cornerRadius = 12.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
    }
}

public class BtnGreen: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.titleLabel?.font = UIFont.setAppFontSemiBold(12)
        self.titleLabel?.textColor = UIColor.black
        self.backgroundColor = UIColor.init(hex: "#07ab17")
        self.layer.cornerRadius = 4.0
    }
}

public class ProfileImageView: UIImageView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.width / 2.0
    }
}

class PickerButton: UIButton {

    var myView: UIView? = UIView()
    var toolBarView: UIView? = UIView()
    
    override var inputView: UIView? {
        get {
            myView
        }
        
        set {
            myView = newValue
            becomeFirstResponder()
        }
    }

    override var inputAccessoryView: UIView? {
        get {
            toolBarView
        }
        set {
            toolBarView = newValue
        }
    }
    
    override var canBecomeFirstResponder: Bool {
       true
    }

}
//UITextField
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
        self.font = UIFont.setAppFontRegular(16)
        self.textColor = UIColor.appHeadingTextColor()
        self.borderStyle = .none
    }
}
//UILabel
public class APPSmallLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.font = UIFont.setAppFontMedium(16)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
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
        self.font = UIFont.setAppFontSemiBold(12)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
    }
}

public class APPDefaultHeaderLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.font = UIFont.setAppFontSemiBold(18)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
    }
}

public class APPViewHeadingLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.font = UIFont.setAppFontSemiBold(18)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
    }
}

public class APPEmployeeDataTaskLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.font = UIFont.setAppFontMedium(12)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
    }
}

public class APPSubHeadingLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.font = UIFont.setAppFontRegular(30)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
    }
}

public class APPSelectionLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.font = UIFont.setAppFontSemiBold(16)
        self.textColor = UIColor.appHeadingTextColor()
        self.backgroundColor = UIColor.clear
    }
}

// TextView Style
public class TxtViewAddEvent: UITextView {
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        self.backgroundColor = UIColor.clear
        self.font = UIFont.setAppFontRegular(16)
        self.textColor = UIColor.appHeadingTextColor()
    }
}

extension UITextView: UITextViewDelegate
{
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.count > 0
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height
            
            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()
        
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100
        
        placeholderLabel.isHidden = self.text.count > 0
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
}
