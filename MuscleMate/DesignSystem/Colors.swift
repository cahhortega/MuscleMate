//
//  Colors.swift
//  TICProject
//
//  Created by Carolina Ortega on 04/12/25.
//

import SwiftUI

extension Color {
    init(light: Color, dark: Color) {
        self = Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark
            ? UIColor(dark)
            : UIColor(light)
        })
    }
}

extension Color {
    static func designSystem(_ token: DesignSystem.Colors.Token) -> Self {
        token.color
    }
}

extension ShapeStyle where Self == SwiftUI.Color {
    static func designSystem(color token: DesignSystem.Colors.Token) -> Self {
        token.color
    }
}

extension DesignSystem {
    enum Colors {
        enum Token {
            case background(Background)
            case main(Main)
            
            var color: SwiftUI.Color {
                switch self {
                case .background(let background):
                    return background.color
                    
                case .main(let main):
                    return main.color
                }
            }
        }
        
        enum Main {
            case primary, text
            
            var color: SwiftUI.Color {
                switch self {
                case .text:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.0509923175, green: 0.03922142088, blue: 0.1529058516, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 0.9176321626, green: 0.9331277013, blue: 1, alpha: 1)),
                    )
                case .primary:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.5447436571, green: 0.4587467313, blue: 1, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 2.276491068e-05, green: 0.8822369576, blue: 0.5687555075, alpha: 1)),
                    )
                    
                }
            }
        }
        
        enum Background {
            case primary, secondary
            
            var color: SwiftUI.Color {
                switch self {
                case .primary:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.8434109092, green: 0.8589085937, blue: 0.9253601432, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 0.008699401282, green: 0.001736404025, blue: 0.08825393766, alpha: 1))
                    )
                case .secondary:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.7442076802, green: 0.7692676783, blue: 0.9172796011, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 0.1325105131, green: 0.1423766613, blue: 0.2839796543, alpha: 1))
                    )
                }
            }
        }
    }
}
