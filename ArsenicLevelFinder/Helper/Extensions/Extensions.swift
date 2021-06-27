//
//  Extensions.swift
//  ArsenicLevelFinder
//
//  Created by Arun Mohan on 25/06/21.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension Color {
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {

        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

       
        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            return (0, 0, 0, 0)
        }
        
        return (r, g, b, o)

    }
}


extension UIColor {

    func rgb() -> Int? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
//            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
//            let iBlue = Int(fBlue * 255.0)
//            let iAlpha = Int(fAlpha * 255.0)
            
            return iGreen
        }
         return nil
    }
}

