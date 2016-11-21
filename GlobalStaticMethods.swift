//
//  GlobalStaticMethods.swift
//  Skeleton
//
//  Created by  Traffic MacBook Pro on 5/24/16.
//  Copyright © 2016 My Macbook Pro. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration


class DeviceUtil {
    
    /* ======================================================================================
     Enum for Device
     ========================================================================================= */
    
    
    enum  Device: Int {
        case iPhone4 ,
        iPhone5,
        iPhone6 ,
        iPhone6Plus ,
        iPadMini,
        iPad,
        iPadPro,
        Unknown
        
    }
    
    
    /* ======================================================================================
     Static variable to get screen size which is orientation independent and it is "let" so only
     first time call's geteSize(private method). In this geteSize call's only first time.
     
     value == CGSize
     ===================================================================================== */
    static let size : CGSize = DeviceUtil.getSize()
    
    
    /* ======================================================================================
     Static variable to get device type according to screen height it is "let" so only
     first time call's getDeviceType(private method). In this getDeviceType call's only first time.
     
     i.e if current device height is 960 then return iphone 4
     
     value == Device Enum
     ===================================================================================== */
    
    static let deviceType : Device = DeviceUtil.getDeviceType()
    
    
    
    
    /* ======================================================================================
     
     Private static method to get screen size
     
     Parameter == nil;
     Return == CGSize
     
     ===================================================================================== */
    private static func getSize() -> CGSize {
        var size : CGSize = CGSizeMake(UIScreen.mainScreen().nativeBounds.size.width/UIScreen.mainScreen().scale,  UIScreen.mainScreen().nativeBounds.size.height/UIScreen.mainScreen().scale)
        
        // For iPhone 6 Plus
        
        if(size.height == 640 && size.width  == 360){
            size = CGSizeMake(414, 736)
        }
        
        return size
    }
    
    
    /* ======================================================================================
     
     Private static method to get Device Type
     
     Parameter == nil;
     Return == Device Enum
     
     ===================================================================================== */
    
    private static func getDeviceType() -> Device
    {
        
        let height = UIScreen.mainScreen().nativeBounds.size.height
        
        switch height {
        case  960:
            return .iPhone4
        case  1136:
            return .iPhone5
        case  1334:
            return .iPhone6
        case  2208:
            return .iPhone6Plus
        case  1024:
            return .iPadMini
        case  2048:
            return .iPad
        case  2732:
            return .iPadPro
        default:
            return .Unknown;
        }
    }
    
    
    /* ======================================================================================
     
     Static method to get Device Language
     
     Parameter == nil;
     Return ==  NSString    i.e "en-US"
     
     
     ===================================================================================== */
    
    static func getDeviceLanguage() -> NSString
    {
        let pre = NSLocale.preferredLanguages()[0]
        
        return pre;
    }
    
    /* ======================================================================================
     
     Static method to get Device Orienttation is in LandscapeLeft or LandscapeRight
     
     Parameter == nil;
     Return ==  BOOL   
     
     i.e "Orienttation == .LandscapeLeft"
     return true
     
     
     ===================================================================================== */
    
    static func isLandscape() -> Bool
    {
        let orientation : UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation;
        
        if (orientation == .LandscapeLeft || orientation == .LandscapeRight)
        {
            return true
        }
        return false
    }
}

class GlobalStaticMethods {
    //NSArray *ControllersArray
    
    
    
    
    
    
    static func validateTextFields(textFieldType: Int , text: String) -> Bool{
        
        
        if textFieldType == txtFieldTypeEnum.name.rawValue {
            if text.characters.count < 3 || text.characters.count > 20 {
                return false
            }
            return true
        }
        else if textFieldType == txtFieldTypeEnum.email.rawValue{
            
            return GlobalStaticMethods.isValidEmail(text)
        }
            
        else if textFieldType == txtFieldTypeEnum.password.rawValue{
            
            return GlobalStaticMethods.isValidPassword(text)
            
        }
            
        else if textFieldType == txtFieldTypeEnum.phone.rawValue {
            return GlobalStaticMethods.isValidNumber(text)
        }
            
        else{
            return false
        }
    }
    
    
    static func getMessageFromStatusCode(statusCodeVal : Int)->String{
        if statusCodeVal == statusCode.success.rawValue {
            return statusCodeMessages.success.rawValue
        }
        else if statusCodeVal == statusCode.invalidSession.rawValue {
            return statusCodeMessages.invalidSession.rawValue
        }
        else if statusCodeVal == statusCode.noRecordFound.rawValue {
            return statusCodeMessages.noRecordFound.rawValue
        }
        else if statusCodeVal == statusCode.notAvailableForUserType.rawValue {
            return statusCodeMessages.notAvailableForUserType.rawValue
        }
        else if statusCodeVal == statusCode.updatePassword.rawValue {
            return statusCodeMessages.updatePassword.rawValue
        }
        else if statusCodeVal == statusCode.invalidRequest.rawValue {
            return statusCodeMessages.invalidRequest.rawValue
        }
        else if statusCodeVal == statusCode.passwordEmpty.rawValue {
            return statusCodeMessages.passwordEmpty.rawValue
        }
            
        else if statusCodeVal == statusCode.uniqueIdentifier.rawValue {
            return statusCodeMessages.uniqueIdentifier.rawValue
        }
        else if statusCodeVal == statusCode.sessionToken.rawValue {
            return statusCodeMessages.sessionToken.rawValue
        }
        else if statusCodeVal == statusCode.addedToFav.rawValue {
            return statusCodeMessages.addedToFav.rawValue
        }
        else if statusCodeVal == statusCode.removedFromFav.rawValue {
            return statusCodeMessages.removedFromFav.rawValue
        }
        else  if statusCodeVal == statusCode.alreadyAddedToFav.rawValue {
            return statusCodeMessages.alreadyAddedToFav.rawValue
        }
        else{
            return "Try again"
        }
        
    }
    static func getHeaderFooterHeight() -> CGFloat{
        
        if GlobalStaticMethods.isPhone() {
            return 56.0
        }
        else{
            if  GlobalStaticMethods.isPadPro(){
                return 80.0
            }
            else{
                return 65.0
            }
        }
        
        
    }
    
    
    
    static func getDeviceTypeStr() -> String {
        if GlobalStaticMethods.isPad(){
            return "ipad"
        }
        else{
            return "iphone"
        }
    }
    
    static func getDeviceToken() -> String{
        let deviceToken = Singleton.sharedInstance.deviceToken
        
        return deviceToken
    }
    
    static func getDeviceId() -> String{
        let deviceId = UIDevice.currentDevice().identifierForVendor!.UUIDString
        
        return deviceId
    }
    
    
    
    // MARK: - trimStr
    //    +(void)showMsg:(NSString*)msg withTitle:(NSString*)title;
    
    /*   static func getCountriesList()->NSArray{
     
     
     let countriesArr = ["Afghanistan",
     "Albania",
     "Algeria",
     "Andorra",
     "Angola",
     "Antigua and Barbuda",
     "Argentina",
     "Armenia",
     "Aruba",
     "Australia",
     "Austria",
     "Azerbaijan",
     "Bahamas",
     "Bahrain",
     "Bangladesh",
     "Barbados",
     "Belarus",
     "Belgium",
     "Belize",
     "Benin",
     "Bhutan",
     "Bolivia",
     "Bosnia and Herzegovina",
     "Botswana",
     "Brazil",
     "Brunei",
     "Bulgaria",
     "Burkina Faso",
     "Burma",
     "Burundi",
     "Cambodia",
     "Cameroon",
     "Canada",
     "Cape Verde",
     "Central African Republic",
     "Chad",
     "Chile",
     "China",
     "Colombia",
     "Comoros",
     "Congo, Democratic Republic of the",
     "Congo, Republic of the",
     "Costa Rica",
     "Cote d'Ivoire",
     "Croatia",
     "Cuba",
     "Curacao",
     "Cyprus",
     "Czech Republic",
     "Denmark",
     "Djibouti",
     "Dominica",
     "Dominican Republic",
     "East Timor",
     "Ecuador",
     "Egypt",
     "El Salvador",
     "Equatorial Guinea",
     "Eritrea",
     "Estonia",
     "Ethiopia",
     "Fiji",
     "Finland",
     "France",
     "Gabon",
     "Gambia",
     "Georgia",
     "Germany",
     "Ghana",
     "Greece",
     "Grenada",
     "Guatemala",
     "Guinea",
     "Guinea-Bissau",
     "Guyana",
     "Haiti",
     "Holy See",
     "Honduras",
     "Hong Kong",
     "Hungary",
     "Iceland",
     "India",
     "Indonesia",
     "Iran",
     "Iraq",
     "Ireland",
     "Israel",
     "Italy",
     "Jamaica",
     "Japan",
     "Jordan",
     "Kazakhstan",
     "Kenya",
     "Kiribati",
     "Korea, North",
     "Korea, South",
     "Kosovo",
     "Kuwait",
     "Kyrgyzstan",
     "Laos",
     "Latvia",
     "Lebanon",
     "Lesotho",
     "Liberia",
     "Libya",
     "Liechtenstein",
     "Lithuania",
     "Luxembourg",
     "Macau",
     "Macedonia",
     "Madagascar",
     "Malawi",
     "Malaysia",
     "Maldives",
     "Mali",
     "Malta",
     "Marshall Islands",
     "Mauritania",
     "Mauritius",
     "Mexico",
     "Micronesia",
     "Moldova",
     "Monaco",
     "Mongolia",
     "Montenegro",
     "Morocco",
     "Mozambique",
     "Namibia",
     "Nauru",
     "Nepal",
     "Netherlands",
     "Netherlands Antilles",
     "New Zealand",
     "Nicaragua",
     "Niger",
     "Nigeria",
     "North Korea",
     "Norway,",
     "Oman,",
     "Pakistan",
     "Palau",
     "Palestinian Territories",
     "Panama",
     "Papua New Guinea",
     "Paraguay",
     "Peru",
     "Philippines",
     "Poland",
     "Portugal",
     "Qatar",
     "Romania",
     "Russia",
     "Rwanda",
     "Saint Kitts and Nevis",
     "Saint Lucia",
     "Saint Vincent and the Grenadines",
     "Samoa",
     "San Marino",
     "Sao Tome and Principe",
     "Saudi Arabia",
     "Senegal",
     "Serbia",
     "Seychelles",
     "Sierra Leone",
     "Singapore",
     "Sint Maarten",
     "Slovakia",
     "Slovenia",
     "Solomon Islands",
     "Somalia",
     "South Africa",
     "South Korea",
     "South Sudan",
     "Spain",
     "Sri Lanka",
     "Sudan",
     "Suriname",
     "Swaziland",
     "Sweden",
     "Switzerland",
     "Syria",
     "Taiwan",
     "Tajikistan",
     "Tanzania",
     "Thailand",
     "Timor-Leste",
     "Togo",
     "Tonga",
     "Trinidad and Tobago",
     "Tunisia",
     "Turkey",
     "Turkmenistan",
     "Tuvalu",
     "Uganda",
     "Ukraine",
     "United Arab Emirates",
     "United Kingdom",
     "Uruguay",
     "Uzbekistan",
     "Vanuatu",
     "Venezuela",
     "Vietnam",
     "Yemen",
     "Zambia","Zimbabwe"]
     
     return countriesArr
     
     }*/
    
    
    static  func validateNumber(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluateWithObject(value)
        return result
    }
    
    
    static func isValidNumber(number : String) -> Bool{
        
        
        let badCharacters = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        
        if number.rangeOfCharacterFromSet(badCharacters) == nil {
            return true
        } else {
            return false
        }
        //        if number.characters.count < 6 {
        //            return false
        //        }
        //        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        //        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        //        let result =  phoneTest.evaluateWithObject(number)
        //        return result
    }
    static func isPhoneNumber(number : String) -> Bool{
        
        let charcter  = NSCharacterSet(charactersInString: "+0123456789").invertedSet
        var filtered:NSString!
        let inputString:NSArray = number.componentsSeparatedByCharactersInSet(charcter)
        filtered = inputString.componentsJoinedByString("")
        return  number == filtered
        
    }
    
    
    static func isValidPasswordNumber(password : String) -> Bool{
        if password.characters.count < 8{
            return false
        }
        let passwordRegEx =   "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,14}$"
        let passwordTest = NSPredicate(format: "SELF contains[c] %@", passwordRegEx)
        let result = passwordTest.evaluateWithObject(password)
        return result
    }
    
    static func isValidPassword(password : String) -> Bool{
        if password.characters.count < 6{
            return false
        }
        let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,14}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluateWithObject(password)
        return result
    }
    
    static func isValidEmail(email : String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
    static func isLettersOnly(value : String) -> Bool{
        for chr in value.characters {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
                return false
            }
        }
        return true
    }
    
    static func isLettersANDSpacesOnly(value : String) -> Bool{
        let letterSpaceRegEx = "^[a-zA-Z0-9_ ]*$"
        let letterTest = NSPredicate(format: "SELF MATCHES %@", letterSpaceRegEx)
        let result = letterTest.evaluateWithObject(value)
        return result
    }
    
    static func isValidYoutubeUrl(value : String) -> Bool {
        
        
        let youtubeRegex = "(http(s)?:\\/\\/)?(www\\.|m\\.)?youtu(be\\.com|\\.be)(\\/watch\\?([&=a-z]{0,})(v=[\\d\\w]{1,}).+|\\/[\\d\\w]{1,})"
        let letterTest = NSPredicate(format: "SELF MATCHES %@", youtubeRegex)
        let result = letterTest.evaluateWithObject(value)
        return result
        
    }
    
    
    
    static func isPhone()->Bool{
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone{
            
            return true
        }
        else
        {
            return   false
            
        }
    }
    static func isPad()->Bool{
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad{
            
            return true
        }
        else
        {
            return   false
            
        }
    }
    static func isPadPro()->Bool{
        
        var height : CGFloat = 0.0
        if UIApplication.sharedApplication().statusBarOrientation.isLandscape {
            height = 1024
        }
        else{
            height = 1366
        }
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad && UIScreen.mainScreen().bounds.size.height == height{
            
            return true
        }
        else
        {
            return   false
            
        }
    }
    
}
class Alert {
    static func showAlertMsgWithTitleWithRootView( title : String , msg : String , btnActionTitle : String , viewController : UIViewController?, completionAction: (Void) -> Void ) -> Void{
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: btnActionTitle, style: .Default, handler: { (action) in
            
            completionAction()
        })
        
        
        alertController .addAction(alertAction)
        
        
        // return alertController
        if viewController != nil {
            viewController! .presentViewController(alertController, animated: true, completion: nil)
        }else{
            
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
    
    
    
    
    
    
    static func showAlertMsgWithTitle( title : String , msg : String , btnActionTitle : String , viewController : UIViewController, completionAction: (Void) -> Void ) -> Void{
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: btnActionTitle, style: .Default, handler: { (action) in
            
            completionAction()
        })
        
        
        alertController .addAction(alertAction)
        
        
        // return alertController
        viewController .presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    static func showAlertMsgWithTitle( title : String , msg : String , otherBtnTitle : String , otherBtnAction: (Void) -> Void , cancelBtnTitle : String , cancelBtnAction: (Void) -> Void, viewController : UIViewController ) -> Void{
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        
        let doneAction = UIAlertAction(title: otherBtnTitle, style: .Default, handler: { (action) in
            
            otherBtnAction()
        })
        
        
        let cancelAction = UIAlertAction(title: cancelBtnTitle, style: .Default, handler: { (action) in
            
            cancelBtnAction()
        })
        
        alertController .addAction(doneAction)
        
        alertController .addAction(cancelAction)
        
        
        // return alertController
        viewController .presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    static func showAlertMsgWithTitle( title : String , msg : String , otherBtnTitle : String , otherBtnAction: (Void) -> Void , viewController : UIViewController ) -> Void{
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        
        let doneAction = UIAlertAction(title: otherBtnTitle, style: .Default, handler: { (action) in
            
            otherBtnAction()
        })
        
        
        
        alertController .addAction(doneAction)
        
        
        
        // return alertController
        viewController .presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    static func showAlertForDropDowns(title : String , message : String , vc : UIViewController){
        Alert.showAlertMsgWithTitle(title, msg: message, otherBtnTitle: "Ok", otherBtnAction: { (Success) in
            printLog("")
            }, viewController: vc)
        
    }
    
    
}

class Singleton {
    static let sharedInstance = Singleton()
    
    var sessionToken : String = ""
    var deviceToken : String = ""
    
    
    
    var projectDataDictionary : NSArray!
    
    
    
    
    //    init() {
    //        
    ////    projectDataDictionary =  plist .loadDataFromPlist("RequestVCType")
    //        
    //        uncomment this and add your plist file name
    //    }
    
}

class imageClass {
    static  func getImageFromURL(urlStr : String)->UIImage?{
        
        let imageURL = NSURL(string: urlStr)
        
        let image =  UIImage(data: NSData(contentsOfURL: imageURL!)!)
        
        
        return image
        
        
    }
    
    static func convertImageToBase64(image : UIImage) -> String {
        
        let imageData:NSData = UIImagePNGRepresentation(image)!
        
        let strBase64:String = imageData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        
        return strBase64
        
    }
    
    static func convertBase64ToImage(str : String)->UIImage{
        let dataDecoded:NSData = NSData(base64EncodedString: str, options: NSDataBase64DecodingOptions(rawValue: 0))!
        let decodedimage:UIImage = UIImage(data: dataDecoded)!
        
        return decodedimage
    }
    static func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func screenShotViewWithSaveOption(view : UIView!) {
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    func screenShotViewImage(view : UIView!) -> UIImage{
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        return image
    }
}
class stringsClass {
    static func trimStr(str : String) ->String{
        
        return str .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
    }
    
    static func getAttributedStringForHTML(var htmlStr : String , textSize : Int )->NSAttributedString?
    {
        
        
        do {
            
            if htmlStr .isEmpty{
                htmlStr = "<p></p>"
                
            }
            
            let str = "<div style=\"color:#5A5A5A; font-size: \(textSize)px\"><font face=\"MarselisPro\">\(htmlStr)</font></div>"
            
            let data : NSData = str .dataUsingEncoding(NSUnicodeStringEncoding)!
            let attributedOptions : [String: AnyObject] = [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
            ]
            
            let attributedStr = try NSAttributedString.init(data: data, options: attributedOptions, documentAttributes: nil)
            
            return attributedStr
            
            
        }
        catch {
            return nil
            
            
        }
        
        
        
    }
    //loool
    
    static func getAttributedStringForHTMLWithFont( var htmlStr : String , textSize : Int , fontName : String )->NSAttributedString?
    {
        
        
        do {
            
            if htmlStr .isEmpty{
                htmlStr = "<p></p>"
                
            }
            
            let str = "<div style=\"color:#5A5A5A; font-size: \(textSize)px\"><font face=\"\(fontName)\">\(htmlStr)</font></div>"
            
            let data : NSData = str .dataUsingEncoding(NSUnicodeStringEncoding)!
            let attributedOptions : [String: AnyObject] = [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
            ]
            
            let attributedStr = try NSAttributedString.init(data: data, options: attributedOptions, documentAttributes: nil)
            
            return attributedStr
            
            
        }
        catch {
            return nil
            
            
        }
        
        
        
    }
    
    
    static func sanitizeStr (str : String) -> String{
        
        
        let notAllowedCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+ ").invertedSet
        
        let resultSTR = str.componentsSeparatedByCharactersInSet(notAllowedCharacters).joinWithSeparator("")
        
        printLog(resultSTR)
        
        return resultSTR
        
    }
    
    static func containSpecialChars(str : String)->Bool{
        
        let notAllowedCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ").invertedSet
        
        let resultSTR = str.componentsSeparatedByCharactersInSet(notAllowedCharacters).joinWithSeparator("")
        
        printLog(resultSTR)
        
        if resultSTR.characters.count  == str.characters.count
        {
            return false;
        }
        else
        {
            return true;
        }
        
        
    }
    
    static func containOnlyNumbers(str : String)->Bool{
        let notAllowedCharacters = NSCharacterSet(charactersInString: "01234567890").invertedSet
        
        let resultSTR = str.componentsSeparatedByCharactersInSet(notAllowedCharacters).joinWithSeparator("")
        
        printLog(resultSTR)
        
        if resultSTR.characters.count  == str.characters.count
        {
            return false;
        }
        else
        {
            return true;
        }
        
    }
    
    static func formatNumberAsCurrency(number : Int64)-> String{
        
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        
        let str = numberFormatter .stringFromNumber(NSNumber(longLong: number))
        
        
        
        return str!
        
    }
    
    static func isEmptyString(str : String) ->String{
        
        return     str .stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
    }
    
    static func stringWithoutWhitespaces(str : String)->String{
        
        
        let words  : NSArray = str.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        let nospacestring = words .componentsJoinedByString("")
        
        return nospacestring
        
    }
    
    
    
    
}
class reachability{
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}
class language{
    
    
    static func ifLanguageChosen()->Bool{
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        
        
        if ((defaults .valueForKey(constants.basicKeywords.LanguageChosen)) != nil)
        {
            return true;
        }
        
        return false;
        
    }
    
    static func setLanguage( type : ChooseLanguageTypeEnum){
        
        var chosenLang  : String!
        
        if type ==  ChooseLanguageTypeEnum.kLanguageEnglish
        {
            chosenLang = constants.basicKeywords.englishLanguage
        }
        else if type == ChooseLanguageTypeEnum.kLanguageArabic
        {
            chosenLang = constants.basicKeywords.arabicLanguage
        }
        
        
        let userDefaults =   NSUserDefaults.standardUserDefaults()
        
        userDefaults .setObject(chosenLang, forKey: constants.basicKeywords.LanguageChosen)
        
        userDefaults .synchronize()
        
    }
    
    
    static func ifAppLanguageIs(language :String)->Bool{
        if (NSUserDefaults.standardUserDefaults().valueForKey(constants.basicKeywords.LanguageChosen) as! String == language)
        {
            return true;
        }
        
        return false;
    }
    static func getCurrentLanguage()->String{
        //        
        //         if (NSUserDefaults.standardUserDefaults().valueForKey(constants.basicKeywords.LanguageChosen){
        //        
        //        return  (NSUserDefaults.standardUserDefaults().valueForKey(constants.basicKeywords.LanguageChosen)
        //        }
        //        
        return "en"
    }
    
    
    //    static func checkIfSystemLanguageChanged(){
    //        
    //    }
    
    
}

class navigation{
    
    
    
    static let sharedInstance = navigation()
    
    var ControllersArray : NSArray!
    
    
    //    func navigation(){
    //        
    //    }
    
    static func logout(){
        
    }
    
    static func goToViewController(viewControllerIdentifier : String , sideDrawer : MMDrawerController){
        let sb = navigation.getStoryBoardForController(viewControllerIdentifier)!.storyboardObject
        let homeVC = sb.instantiateViewControllerWithIdentifier(viewControllerIdentifier)
        let navCon = sideDrawer.centerViewController as! MMNavigationController
        
        navCon.pushViewController(homeVC, animated: true)
        
    }
    static func PopToVC(viewControllerIdentifier : String , sideDrawer : MMDrawerController){
        
        let navCon = sideDrawer.centerViewController as! MMNavigationController
        
        //       let sb = navigation.getStoryBoardForController(viewControllerIdentifier)?.storyboardObject
        
        
        //   let desiredVC = sb!.instantiateViewControllerWithIdentifier(viewControllerIdentifier)
        
        //        if sideDrawer.visibleLeftDrawerWidth > 0 {
        //            closeDrawer(sideDrawer)
        //
        //        }
        let controllers = navCon.childViewControllers
        let countControllers = controllers.count
        
        let className = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String + "." + viewControllerIdentifier
        
        if navCon.visibleViewController!.isKindOfClass(NSClassFromString(className)!){
            
            
            return
            
        }
        
        for i in 0..<countControllers {
            
            if controllers[i].isKindOfClass(NSClassFromString(className)!)
            {
                
                
                NSLog("controller found at index %d", i)
                
                
                navCon.popToViewController(controllers[i], animated: true)
                return;
                
            }
            
        }
    }
    
    
    static func setViewControllerArray(vcIdentifier : String , navCon : UINavigationController){
        
        let sb = getStoryBoardForController(vcIdentifier)?.storyboardObject
        let vc = sb?.instantiateViewControllerWithIdentifier(vcIdentifier)
        
        navCon.setViewControllers([vc!], animated: true)
        
    }
    static func getMainStoryboardForDevice()->UIStoryboard{
        
        
        let devStr = GlobalStaticMethods.getDeviceTypeStr()
        let boardName = "Main-\(devStr)"
        
        return UIStoryboard(name: boardName, bundle: nil)
        
        
        
        
        
    }
    
    static func setRootViewControllerObj(controller : UIViewController){
        
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = controller
    }
    
    
    static func PopToViewControllerObj(controller : UIViewController){
        
        
        UIApplication.sharedApplication().keyWindow?.rootViewController?.popoverPresentationController
        
        
    }
    static func pushViewContolerObjOnNavController(controller : UIViewController , navController : UINavigationController) {
        
        
    }
    
    
    static func getStoryboardName()->String{
        let devStr = GlobalStaticMethods.getDeviceTypeStr()
        
        return devStr
        
    }
    
    
    
    static func getStoryBoardForController(identifier:String)->(storyboardObject :UIStoryboard , storyBoardName :String)?{
        
        
        
        var boardName : String = ""
        
        if sharedInstance.ControllersArray == nil{
            let plistControllers = NSBundle.mainBundle().pathForResource("controllers", ofType: ".plist")
            
            sharedInstance.ControllersArray = NSArray(contentsOfFile: plistControllers!)
        }
        
        let predicate = NSPredicate(format: "name LIKE[c] %@", identifier)
        let filteredArr = sharedInstance.ControllersArray .filteredArrayUsingPredicate(predicate)
        
        
        if filteredArr.count > 0{
            let str = filteredArr[0].valueForKey("sid") as! String
            boardName = "\(str)-\(navigation.getStoryboardName())"
            
        }
        else{
            printLog("Controller not found in any storyboard")
            //            break
            
            
            
            return nil
            
        }
        
        
        return (UIStoryboard(name: boardName, bundle: nil) , boardName)
        
    }
    
    static func getStoryboad() ->UIStoryboard{
        
        
        let boardName = "\(navigation.getStoryboardName())"
        return UIStoryboard(name: boardName, bundle: nil)
    }
    
    
    
    
    
}





class plist{
    
    static func loadDataFromPlist (plistName : String) -> NSArray{
        let plistPath = NSBundle.mainBundle().pathForResource(plistName, ofType: "plist")
        let dict1 = NSArray(contentsOfFile: plistPath!)
        
        // let dict2 = NSDictionary(contentsOfFile: plistPath!)
        
        
        
        return dict1!
    }
    
    
}





// MARK: - Enums

enum ChooseLanguageTypeEnum : Int{
    case kLanguageEnglish = 1
    case kLanguageArabic
}

enum LAError : Int {
    case AuthenticationFailed
    case UserCancel
    case UserFallback
    case SystemCancel
    case PasscodeNotSet
    case TouchIDNotAvailable
    case TouchIDNotEnrolled
}



enum statusCode : Int {
    
    case success = 1000
    case invalidSession = 1001
    case noRecordFound = 1002
    case notAvailableForUserType = 1003
    case updatePassword = 1004
    case invalidRequest = 1006
    case passwordEmpty = 1007
    case uniqueIdentifier = 1008
    case sessionToken  = 1009
    case addedToFav = 1010
    case removedFromFav = 1011
    case alreadyAddedToFav = 1012
}

enum statusCodeMessages : String{
    case success = "Success"
    case invalidSession = "Invalid Session ID"
    case noRecordFound = "No record found"
    case notAvailableForUserType = "Not available for this usertype"
    case updatePassword = "Password needs to be updated"
    case invalidRequest = "Invalid request"
    case passwordEmpty = "password is empty"
    case uniqueIdentifier = "Unique identifier should not be empty"
    case sessionToken  = "sessionToken is missing"
    case addedToFav = "Property added to favourite list."
    case removedFromFav = "Property removed from favourite list."
    case alreadyAddedToFav = "Property already added to favourite list."
}


enum txtFieldTypeEnum : Int{
    case name = 0
    case email = 1
    case password = 2
    case phone = 3
    case optional = 4
}





//Example of a model

class userRegModelStruct {
    var cellType : userRegFieldTypeEnum
    var keyboardType : UIKeyboardType
    var validationType : txtFieldTypeEnum
    var value : String
    var placeholder : String
    var dropdownType : userRegDropDownTypeEnum
    var rightImage : String
    
    
    init(cellType: userRegFieldTypeEnum, keyboardType: UIKeyboardType, validationType: txtFieldTypeEnum, value:String, placeholder: String, dropdownType : userRegDropDownTypeEnum, rightImage : String){
        self.cellType = cellType
        self.keyboardType = keyboardType
        self.validationType = validationType
        self.value = value
        self.placeholder = placeholder
        self.dropdownType = dropdownType
        self.rightImage = rightImage
    }
    
}




