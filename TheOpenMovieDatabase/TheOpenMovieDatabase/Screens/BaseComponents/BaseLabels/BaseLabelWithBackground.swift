//
//  BaseLabelWithBackground.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import Foundation
import UIKit


class BaseLabelWithBackground : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        self.textColor = .white
        self.textAlignment = .center
        self.numberOfLines = 0
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = UIColor.primaryColor?.cgColor
        self.font = UIFont.systemFont(ofSize: 10)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
    }
}
