//
//  FontCategorySwift.swift
//  SampleSwift
//
//  Created by  Traffic MacBook Pro on 5/17/16.
//  Copyright © 2016 Traffic MacBook Pro. All rights reserved.
//

import UIKit
extension UIFont{
    
    
    func setGeneralFontSizeUsingRatio(nameFont : String , psdFontSize : CGFloat) ->UIFont{
        
        var ratio : CGFloat
        
        //iphone
        var fontNameChanged = nameFont
        
        if fontNameChanged == "Roboto-Regular"{
            fontNameChanged = "Roboto"
        }
        
        if fontNameChanged == "Roboto-Medium"{
            fontNameChanged = "Roboto-Bold"
        }

        if GlobalStaticMethods.isPhone() {
            ratio = psdFontSize/1242

        }
        else{
            printLog(UIScreen.mainScreen().nativeBounds.size.height)
            printLog(constants.deviceType.SCREEN_HEIGHT)
            if constants.deviceType.SCREEN_HEIGHT > 1024 {
                ratio = psdFontSize/2048

            }
            else{
            ratio = psdFontSize/1536
            }
        }
        //ipad pro
        
        //ipad
        
        
        var screenSize : CGFloat
        
        let screenRect : CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth: CGFloat = screenRect.size.width
        
        let screenHeight: CGFloat = screenRect.size.height
        
        
        if screenWidth<screenHeight {
            screenSize = screenWidth;
        }
        else{
            screenSize = screenHeight;
            
        }
        var fontsize = screenSize * ratio
        if fontsize < 14{
            fontsize = 14
        }
        
     //   fontNameChanged = "Roboto"
        
        return UIFont(name: fontNameChanged, size: fontsize)!
        
        
        
    }
}