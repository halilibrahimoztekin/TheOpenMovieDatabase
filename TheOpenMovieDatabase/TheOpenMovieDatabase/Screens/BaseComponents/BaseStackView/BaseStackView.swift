//
//  BaseStackView.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import Foundation
import UIKit

class BaseStackView : UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 10
        self.distribution = .fillEqually
    }
}
