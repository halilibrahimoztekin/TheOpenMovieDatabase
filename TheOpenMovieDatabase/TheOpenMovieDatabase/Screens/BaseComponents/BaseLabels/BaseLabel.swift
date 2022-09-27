//
//  BaseLabel.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import Foundation
import UIKit

class BaseHeaderLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabelView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelView (){
        self.textColor = .darkPrimaryColor
        self.textAlignment = .center
        self.numberOfLines = 0
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.2
    }
    
}
