//
//  UIColor+Theme.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-02.
//

import Foundation
import UIKit

extension UIColor {
    static var buttonBackground: UIColor {
        return UIColor.dynamicColor(
            light: UIColor(red: 0.3, green: 0.5, blue: 0.8, alpha: 1.0),
            dark: UIColor(red: 0.4, green: 0.6, blue: 0.7, alpha: 1.0)
        )
    }

    static var buttonText: UIColor {
        return UIColor.dynamicColor(
            light: UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1),
            dark: UIColor(red: 0.97, green: 0.92, blue: 0.9, alpha: 1)
        )
    }

    private static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor { traitCollection -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }
}
