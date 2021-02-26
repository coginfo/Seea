//
//  Helper.swift
//  Aglie
//
//  Created by Anand-iMac on 08/10/18.
//  Copyright © 2018 Newgood. All rights reserved.
//

import UIKit
import UserNotifications
import TTGSnackbar
import Kingfisher

var container: UIView = UIView()
var loadingView: UIView = UIView()
var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
var globalClassName = ""

enum SnackBarType {
    case Failure
    case Success
    case Warning
    case InfoOrNotes
    case Toast
}

struct Validation {
    static let EMAIL_MIN = 5
    static let EMAIL_MAX = 120
    static let PASSWORD_MIN = 8
    static let PASSWORD_MAX = 16
    static let OTP_MIN = 6
}

class Helper: NSObject {
    
    var snackBar : TTGSnackbar? = nil
    
    class var shared: Helper {
         struct Static {
             static let instance: Helper = Helper()
         }
         return Static.instance
     }
    
     func togglePasswordVisibility(textFiled: UITextField) {
         if let textRange = textFiled.textRange(from: textFiled.beginningOfDocument, to: textFiled.endOfDocument) {
             textFiled.replace(textRange, withText: textFiled.text!)
         }
     }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return Session.sharedInstance.userDefaults.object(forKey: key) != nil
    }
    
    public func removeWhiteSpace(text:String) -> String
    {
         return text.trimmingCharacters(in: CharacterSet.whitespaces)
        
    }
    
    func setTextFieldImage(imageName:String,textField:UITextField)  {
        let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.clear

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        view.addSubview(imageView)

        view.backgroundColor = .clear
        textField.leftView = view
        textField.leftViewMode = UITextField.ViewMode.always
        //textField.layer.sublayerTransform = CATransform3DMakeTranslation(0, 0, 10)
    }
    func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,61}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
    
    func canOpenURL(string: String?) -> Bool {
        guard let urlString = string else {return false}
        guard let url = NSURL(string: urlString) else {return false}
        if !UIApplication.shared.canOpenURL(url as URL) {return false}
        
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: string)
    }
    
    func isValidEmailAddress (strValue:String)-> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$", options: [.caseInsensitive])
        return regex.firstMatch(in: strValue, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, strValue.count)) != nil
    }
    
    func isValidEmailAddressCount (strValue:String)-> Bool {
        
        let tempVal = strValue.components(separatedBy: "@") as NSArray
        if (tempVal[0] as! String).count > MAX_EMAIL_CHARACTER_COUNT_LEFT
        {
            return false
        }
        else if (tempVal[1] as! String).count > MAX_EMAIL_CHARACTER_COUNT_RIGHT
        {
            return false
        }
        else{
            return true
        }
    }
    
    func isCharValidPassword(textString: String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: textString)
        
        
        let lowerLetterRegEx  = ".*[a-z]+.*"
        let lowertest = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
        let lowerResult = lowertest.evaluate(with: textString)
        
        let numberRegEx  = ".*[0-9]+.*"
        let numerictest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = numerictest.evaluate(with: textString)
        
        let blankSpaceRegEx  = ".*[ ]+.*"
        let blanktest = NSPredicate(format:"SELF MATCHES %@", blankSpaceRegEx)
        let blankresult = blanktest.evaluate(with: textString)
        
        
        let specialCharacterRegEx  = ".*[!&^%$#@()?/]+.*"
        let specialChar = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = specialChar.evaluate(with: textString)
        
        
        if(!(textString.count >= MIN_PASSWORD && textString.count <= MAX_PASSWORD)){
            return false
        }
        else if(!capitalresult)
        {
            return false
        }
        else if(!lowerResult)
        {
            return false
        }
        else if(!numberresult){
            return false
        }
        else if(!specialresult){
            return false
        }
        else if(blankresult){
            return false
        }
        else{
            return true
        }
    }
    
    func isCheckForValidPassword(textString: String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: textString)
        
        
        let lowerLetterRegEx  = ".*[a-z]+.*"
        let lowertest = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
        let lowerResult = lowertest.evaluate(with: textString)
        
        let numberRegEx  = ".*[0-9]+.*"
        let numerictest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = numerictest.evaluate(with: textString)
        
        let blankSpaceRegEx  = ".*[ ]+.*"
        let blanktest = NSPredicate(format:"SELF MATCHES %@", blankSpaceRegEx)
        let blankresult = blanktest.evaluate(with: textString)
        
        
        let specialCharacterRegEx  = ".*[!&^%$#@()?/]+.*"
        let specialChar = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = specialChar.evaluate(with: textString)
        
        
        if(!(textString.count >= MIN_PASSWORD && textString.count <= MAX_PASSWORD)){
            return false
        }
        else if(!capitalresult)
        {
            return false
        }
        else if(!lowerResult)
        {
            return false
        }
        else if(!numberresult){
            return false
        }
        else if(!specialresult){
            return false
        }
        else if(blankresult){
            return false
        }
        else{
            return true
        }
        
    }
    
    func isValidPassword (strValue:String)-> Bool {
        if strValue.count < Validation.PASSWORD_MIN || strValue.count > Validation.PASSWORD_MAX {
            return false
        }
        return true
    }
    
    func isValidURL (urlString: String?) -> Bool {
        let urlRegEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: urlString)
    }
    
    func doStringContainsNumber( _string : String) -> Bool{
        let numberRegEx  = ".*[0-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: _string)
        return containsNumber
    }
    
    func showSnackBarAlert(message: String, type: SnackBarType) {
        
        if(self.snackBar != nil)
        {
            self.snackBar?.dismiss()
        }
        
        self.snackBar = TTGSnackbar(message: message, duration: .middle)
        snackBar?.messageTextColor = .white
        snackBar?.show()
        switch type {
        case .Success:
            snackBar?.backgroundColor = UIColor().snackBarColorSuccess()
            break
        case .Failure:
            snackBar?.backgroundColor = UIColor.red
            break
        case .Warning:
            snackBar?.backgroundColor = UIColor().snackBarColorWarning()
            break
        case .InfoOrNotes:
            snackBar?.backgroundColor = UIColor().snackBarColorInfo()
            break
        case .Toast:
            snackBar?.backgroundColor = UIColor.init(white: 0.95, alpha: 0.95)
            snackBar?.messageTextColor = UIColor.getAppLightBlackColor()
            break
        }
    }
}



extension String {
    
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x1F1E6...0x1F1FF, // Regional country flags
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
            127000...127600, // Various asian characters
            65024...65039, // Variation selector
            9100...9300, // Misc items
            8400...8447:
                return true
            default:
                continue
            }
        }
        return false
    }
    
}

public extension UIViewController {

    /// To take class name of the viewcontroller
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
    
    
    
    func showActivityIndicator(_ uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
   
    public func convertDictionaryToJsonString(userDict:AnyObject) -> String
    {
        let jsonData = try? JSONSerialization.data(withJSONObject: userDict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString ?? "Not parsed")
        return jsonString!
        
    }
    
    public func convertJSONStringToDictionary(userDict:String) -> [String: Any]?
    {
        if let data = userDict.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
        
    }
    

    public func loadImage(url: String, imageView: UIImageView) {
        
        let tempUrl = URL(string: API_IMAGE_BASE_URL + url)
        imageView.kf.setImage(with: tempUrl, placeholder: UIImage(named: "lockPlaceHolder"), options: [.transition(.fade(0.2))])
    }
    
    public func removeWhiteSpace(text:String) -> String
    {
        return text.trimmingCharacters(in: CharacterSet.whitespaces)
    }
  
    public func hideActivityIndicator(_ uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }

    func getDefaultHeaderDetails() -> [String:String]
    {
        let headers = ["Authorization":  Session.sharedInstance.getAccessToken()]
        print(headers)
        return headers
    }
    /*
     Define UIColor from hex value
     
     @param rgbValue - hex color value
     @param alpha - transparency level
     */
    func isValidPassword (strValue:String)-> Bool {
        
        if strValue.count < MIN_PASSWORD || strValue.count > MAX_PASSWORD
        {
            return false
        }
        return true
    }
   
    func PasswordWithOutNumeric(password: String) -> Bool {
        let regularExpression = ".*[+-]?(?:\\d+(?:\\.\\d*)?|\\.\\d+).*"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: password)
    }
    func PasswordWithOutSmalPlapha(password: String) -> Bool {
          let upper = password.uppercased()
        if upper != password{
            return true
        }else{
             return false
        }

    }
    func PasswordWithOutCapitalapha(password: String) -> Bool {
        let lower = password.lowercased()
        if lower != password{
            return true
        }else{
            return false
        }
    }
    
    func PasswordWithSpecial(password: String) -> Bool {
        let regularExpression = ".*[\\!@#$%^&*_(){}~`;:'\"//<>|?.,+-=].*"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: password)
    }
    
    func isCharValidPassword(password: String) -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[_$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: password)
    }
    
    public func UIColorFromHex(_ rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    public func isStringNumeric(text:String) -> Bool
    {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        if !text.isEmpty && text.rangeOfCharacter(from: numberCharacters) == nil {
            return true
        } else {
            return false
        }
    }
   
    public func showAlertView(message:String, controller:UIViewController)
    {
        let alert = UIAlertController(title: APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func isStringAnDouble(string: String) -> Bool {
        return Double(string) != nil
    }
}
extension UIImageView {
    
    
   func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
}

// MARK: - Extensions
extension UIFont {
    
    class func setAppFontRegular(_ size:CGFloat)->(UIFont) {
        return UIFont(name: "Poppins-Regular", size: size)!
    }
    
    class func setAppFontMedium(_ size:CGFloat)->(UIFont) {
        return UIFont(name: "Poppins-Medium", size: size)!
    }
    
    class func setAppFontBold(_ size:CGFloat)->(UIFont) {
        return UIFont(name: "Poppins-Bold", size: size)!
    }
    
    class func setAppFontLight(_ size:CGFloat)->(UIFont) {
        return UIFont(name: "Poppins-Light", size: size)!
    }
    
    class func setAppFontSemiBold(_ size:CGFloat)->(UIFont) {
        return UIFont(name: "Poppins-SemiBold", size: 12)!
    }
}
// MARK: - Color
extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

// MARK: - UIViewController
extension UIViewController {
    
    func getImage(imgName:String) -> UIImage {
        return UIImage.init(named: imgName) ?? UIImage()
    }
}

// MARK: - UIDevice
extension UIDevice {
    
    var hasNotch: Bool {
        
        if #available(iOS 11.0, *)
        {
            let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottom > 0
        } else
        {
            // Fallback on earlier versions
            return false
        }
    }
}
