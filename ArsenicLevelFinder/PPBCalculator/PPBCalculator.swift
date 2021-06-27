//
//  PPBCalculator.swift
//  ArsenicLevelFinder
//
//  Created by Arun Mohan on 26/06/21.
//

import Foundation
import SwiftUI

class PPBCalculator {
    
     var gIntensity: Double = 0.00
    func calculatePPB(greenValue: Int) -> Int {
        let div: Double = (Double(greenValue) / 231)
        self.gIntensity = -log10(div)
        switch(gIntensity) {
        case ..<0:
            return 0
        case 0..<0.08:
            return 0
        case  0.08..<0.12:
            return 10
        case 0.12..<0.14:
            return 20
        case 0.14..<0.18:
            return 40
        case 0.18..<0.23:
            return 80
        case 0.23..<0.28:
            return 120
        default:
            return 160
        }
    }
    
    func getGreenColor(myColor: Color) -> Int {
        let greenColor = UIColor(myColor)
        return greenColor.rgb() ?? 0
    }
}
