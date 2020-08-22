//
//  Color+Ext.swift
//  Airlock
//
//  Created by Laurent B on 22/08/2020.
//

import Foundation
import SwiftUI

extension Color {
    public static var outlineRed: Color {
        return Color(decimalRed: 34, green: 0, blue: 3)
    }
    
    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
    }
    
    public static var lightRed: Color {
            return Color(decimalRed: 239, green: 54, blue: 128)
        }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red/255, green: green/255, blue: blue/255)
    }
}
