//
//  Typography.swift
//  TICProject
//
//  Created by Carolina Ortega on 04/12/25.
//

import SwiftUI

extension Font {
    static func designSystem(_ typography: DesignSystem.Typography) -> Self {
        typography.font
    }
}

extension DesignSystem {
    enum Typography {
        case display1
        case display2
        case display3
        case heading1
        case heading2
        case body1
        case body2
        case caption
        
        var font: Font {
            switch self {
            case .display1:
                Font.custom("DMSans-Black", size: 48)
            case .display2:
                Font.custom("DMSans-ExtraBold", size: 40)
            case .display3:
                Font.custom("DMSans-Bold", size: 32)
            case .heading1:
                Font.custom("DMSans-SemiBold", size: 24)
            case .heading2:
                Font.custom("DMSans-Medium", size: 20)
            case .body1:
                Font.custom("DMSans-Regular", size: 14)
            case .body2:
                Font.custom("DMSans-Light", size: 12)
            case .caption:
                Font.custom("DMSans-ExtraLight", size: 10)
            }
        }
    }
}
