//
//  SplashScreenVC.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import UIKit

class SplashScreenVC: UIViewController {
    private let label: UILabel = {
        let label = BaseFeatureLabel(frame: .zero)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(label)
        label.frame.size = CGSize(width: 100, height: 100)
        label.center = view.center
        label.text = "Selam"
    }
    
}
