//
//  UIImageView+Extension.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import Foundation
import UIKit
import SDWebImage
extension UIImageView {

    func setImage(with url: String) {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: url), placeholderImage: nil, options: [.progressiveLoad]) { image, error, cache, url in
            if let _ = error {
                self.image = UIImage(named: "noImage")
                self.contentMode = .scaleAspectFit
            }
        }
    }

    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter { $0 is UIVisualEffectView }
        blurredEffectViews.forEach { blurView in
            blurView.removeFromSuperview()
        }
    }
}
