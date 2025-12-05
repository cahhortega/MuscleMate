//
//  Colors.swift
//  MuscleMate
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
            
            var color: SwiftUI.Color {
                switch self {
                case .background(let background):
                    return background.color
                }
            }
        }
        
        enum Main {
            case purple, lilac, green, grey
            
            var color: SwiftUI.Color {
                switch self {
                case .purple:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.08633419126, green: 0.06666406244, blue: 0.2470581532, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 0.08633419126, green: 0.06666406244, blue: 0.2470581532, alpha: 1)),
                    )
                case .lilac:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.5447436571, green: 0.4587467313, blue: 1, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 0.5447436571, green: 0.4587467313, blue: 1, alpha: 1)),
                    )
                case .green:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 2.276491068e-05, green: 0.8822369576, blue: 0.5687555075, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 2.276491068e-05, green: 0.8822369576, blue: 0.5687555075, alpha: 1)),
                    )
                case .grey:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.8434109092, green: 0.8589085937, blue: 0.9253601432, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 0.8434109092, green: 0.8589085937, blue: 0.9253601432, alpha: 1)),
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
                        dark: SwiftUI.Color(#colorLiteral(red: 0.01961011253, green: 0.003921897616, blue: 0.1842778921, alpha: 1))
                        )
                case .secondary:
                    SwiftUI.Color(
                        light: SwiftUI.Color(#colorLiteral(red: 0.3921684623, green: 0.4470038414, blue: 0.5845002532, alpha: 1)),
                        dark: SwiftUI.Color(#colorLiteral(red: 0.1137376353, green: 0.1215943769, blue: 0.243154794, alpha: 1))
                        )
                }
            }
            
        }
    }
}
