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
        case largeTitle
        case section
        case button
        case cell
        case caption
        
        var font: Font {
            switch self {
            case .largeTitle:
                Font.custom("DMSans-Black", size: 48)
            case .section:
                Font.custom("DMSans-Medium", size: 16)
            case .button:
                Font.custom("DMSans-Medium", size: 18)
            case .cell:
                Font.custom("DMSans-Regular", size: 16)
            case .caption:
                Font.custom("DMSans-Light", size: 12)
            }
        }
    }
}
