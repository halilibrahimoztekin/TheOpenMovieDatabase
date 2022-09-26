//
//  UICollectionViewCell+Extension.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import Foundation
import UIKit
extension UICollectionViewCell {
    func shadowDecorate() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds
                                        ,cornerRadius: contentView.layer.cornerRadius).cgPath

    }
}


