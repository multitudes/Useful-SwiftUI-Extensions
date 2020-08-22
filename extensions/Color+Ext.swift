//
//  Color+Ext.swift
//  Airlock
//
//  Created by Laurent B on 22/08/2020.
//

import Foundation
import SwiftUI

// This extension will create predefined static colors that can be used in my app like: Color.lightRed or Color.darkRed. I use a custom init to create colors from decimal values between 0-255
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

// This extension allows to create a Color in swiftUI from the hex value
// ex Color(hex: "FA1859") or Color(hex: "F19") and with opacity as hex number at the end
extension Color {
    init(hex: String, opacity a: Int = 255) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit like #FFF)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit like #FFA344)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (255, 255, 255)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
