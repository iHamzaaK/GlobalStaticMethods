//
//  ImageForIpadPro.swift
//  SampleSwift
//
//  Created by  Traffic MacBook Pro on 5/17/16.
//  Copyright © 2016 Traffic MacBook Pro. All rights reserved.
//

import UIKit
 extension UIImage{
    
    convenience init(setImageForPro:String){
        // dont forget to add if statement for pro
        
        if GlobalStaticMethods.isPadPro(){
            
            self.init(named: "\(setImageForPro)-pro")!
            
            
        }
        else{
        self.init(named: setImageForPro)!
        
        
        }
        
    }
    
    
    
}
