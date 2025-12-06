//
//  UINavigationBar+Extensions.swift
//  MuscleMate
//
//  Created by Carolina Ortega on 05/12/25.
//

import SwiftUI

extension UINavigationBar {
    static func setCustomFont() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        
        appearance.largeTitleTextAttributes = [
            .font: UIFont(name: "DMSans-Black", size: 48)!,
            .foregroundColor: UIColor.label
        ]
        
        appearance.titleTextAttributes = [
            .font: UIFont(name: "DMSans-ExtraBold", size: 18)!,
            .foregroundColor: UIColor.label
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
