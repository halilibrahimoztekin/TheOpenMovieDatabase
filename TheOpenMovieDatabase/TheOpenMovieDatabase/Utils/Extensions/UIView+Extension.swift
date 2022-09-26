//
//  View+Extension.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import Foundation
import UIKit
extension UIView {
    func addSubviews(_ subviews :UIView...) {
        for subview in subviews {
            addSubview(subview)
        }
    }
    func createGradient(){
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.darkPrimaryColor?.cgColor, UIColor.darkGray.cgColor]

        self.layer.insertSublayer(gradient, at: 0)
    }
}
