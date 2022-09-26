//
//  UIApplication+Extension.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 26.09.2022.
//

import Foundation
import UIKit
public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }

        return window
        
    }
}
