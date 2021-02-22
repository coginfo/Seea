//
//  AppColor.swift
//  UBIQUIFIT
//
//  Created by Anand-iMac on 18/07/18.
//  Copyright © 2018 Anand-iMac. All rights reserved.
//

import UIKit


public extension UIColor {
    
    class func refreshCtrlColor() -> UIColor {
        return UIColor.appThemeColor()
    }

    class func appThemeColor()->UIColor {
        return UIColor.init(hexString: "#4937c7")
    }

    class func appViewBackColor()->UIColor {
        return UIColor.init(hexString: "#f4f5fa")
    }
    
    class func searchBackgroundColor()->UIColor {
        return UIColor(red: 222.0/255.0, green: 222.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    }
    
    class func getAppLightBlackColor()->UIColor{
        return UIColor.init(netHex: 0x1D1D46)
    }
    
    class func getDotColor(colorString: String)-> UIColor{
        switch colorString {
        case "blue":
            return UIColor.init(netHex: 0x3500CC)
        case "red":
            return UIColor.init(netHex: 0xFF0303)
        case "green":
            return UIColor.init(netHex: 0x00B500)
        case "purple":
            return UIColor.purple
        case "grey":
            return UIColor.lightGray
        default:
            return UIColor.white
        }
    }
    
    // Snack bar colors
    func snackBarColorSuccess() -> UIColor {
        return UIColor(red: 42.0/255.0, green: 145.0/255.0, blue: 0/255.0, alpha: 1.0)
    }
    
    func snackBarColorFailure() -> UIColor {
        return UIColor(red: 200.0/255.0, green: 09.0/255.0, blue: 09.0/255.0, alpha: 1.0)
    }
    
    func snackBarColorWarning() -> UIColor {
        return UIColor(red: 200.0/255.0, green: 162.0/255.0, blue: 09.0/255.0, alpha: 1.0)
    }
    
    func snackBarColorInfo() -> UIColor {
        return UIColor(red: 42.0/255.0, green: 120.0/255.0, blue: 149.0/255.0, alpha: 1.0)
    }
    
    class func appHeadingTextColor()->UIColor {
        return UIColor.init(hexString: "#191f35")
    }
}
