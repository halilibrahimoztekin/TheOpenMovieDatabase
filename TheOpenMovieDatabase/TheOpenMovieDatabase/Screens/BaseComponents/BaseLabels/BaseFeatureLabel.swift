//
//  BaseFeatureLabel.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import Foundation
import UIKit

class BaseFeatureLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        self.textColor = .primaryColor
        self.textAlignment = .left
        self.numberOfLines = 0
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.2
    }
}
