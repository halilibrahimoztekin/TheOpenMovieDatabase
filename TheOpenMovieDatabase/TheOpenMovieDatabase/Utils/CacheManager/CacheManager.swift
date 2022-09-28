//
//  CacheManager.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 28.09.2022.
//

import Foundation
import SwiftUI

struct CacheManager {
    static let shared = CacheManager()


    func setLogoText(text: String) {
        UserDefaults.standard.set(RemoteConfigEnums.logoText.rawValue, forKey: text)
    }

    var getLogoText: String? {
        return UserDefaults.standard.value(forKey: RemoteConfigEnums.logoText.rawValue) as? String
    }
}
